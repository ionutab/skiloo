package skillo

class WorkSiteController {
    
    def scaffold = true
    
    def index() {
        redirect(action: "list")
    }
}
