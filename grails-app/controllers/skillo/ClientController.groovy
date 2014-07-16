package skillo

import skillo.filters.ClientListSearch

class ClientController extends BaseController {

    def clientService
    
    def index() {
        redirect(action: "list")
    }

    def list(){
        log.info("ClientController.list")
        ClientListSearch filter = new ClientListSearch()
        if(!params.reset){
            bindData(filter,params.search)
        }
        def clientList = clientService.search(filter)
        [ClientList:clientList, ClientTotal: clientList.totalCount]
    }

    def create(){
        log.info("ClientController.create")
        [clientInstance: new Client() ]
    }

    def save(){
        log.info("ClientController.save")

        def client = new Client(params.client)
        def address = new Address(params.address)

        if(params.postCode && params.postCode.id){
            def postCode = PostCode.get(params.postCode.id)
            if(postCode){
                address.postCode = postCode
            }
        }

        if(clientService.save(client)){
            redirect(action: "list")
        } else {
            render(view: "create", model: [clientInstance: client])
        }
    }

    def edit(){
        log.info("ClientController.edit")

        def client = Client.get(params.id)
        if(!client){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        [clientInstance: client]
    }

    def update(){

        def client = Client.get(params.id)

        if(!client){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
            redirect(action: "list")
            return
        }

        if(client.address){
            client.address.properties = params.address
        }

        if(params.postCode?.id && !params.postCode?.id.equals(client.address?.postCode?.id)){
            client.address?.postCode = PostCode.get(params.postCode.id)
        }

        client.properties = params.client

        if(client.version < Long.parseLong(params.version)){
            flash.message = message(code: 'default.optimistic.locking.failure', args: [message(code: 'client.label', default: '${className}'), client.id])
        }

        if(clientService.update(client)){
            flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: '${className}'), client.id])
        } else {
            flash.message = message(code: 'default.not.updated.message', args: [message(code: 'client.label', default: '${className}'), client.id])
        }

        redirect(action: "list")
        return
    }

    def delete(){
        log.info("ClientController.delete")
        def client = Client.get(params.id)
        if(!client){
            flash.message = message(code:'default.not.found.message', args: [message(code:'client.label', default: 'Client')])
            redirect(acion:"list")
            return
        }

        client.active = false

        if(!client.save( deepvalidate:true,flush: true )){
            flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }

        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
        redirect(action:"list")
    }

    def test(){

    }

}
