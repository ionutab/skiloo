package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.candidate.CandidateNote
import skillo.contact.ContactComment
import skillo.user.User

@MultiTenant
class Consultant {

    String firstName
    String lastName

    String email

    String information

    User user

    String telephoneNumber
    String website
    String facebook
    String twitter

    static hasMany = [candidateNotes:CandidateNote, clientComments:ContactComment]
    
    static constraints = {
        email blank: false, email: true


        firstName blank: false, matches: "[a-zA-Z-' ]+"
        lastName blank: false, matches: "[a-zA-Z-' ]+"

        telephoneNumber blank: false, nullable: true, minSize: 13, matches: "[0-9]{5}-[0-9]{3}-[0-9]{3}"

        website blank: false, nullable: true
        facebook blank: false, nullable: true
        twitter blank: false, nullable: true

        candidateNotes nullable: true
        clientComments nullable: true
        information nullable: true
    }

    def getFullName(){
        return firstName+" "+lastName
    }
}
