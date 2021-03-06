package skillo

import grails.plugin.multitenant.core.annotation.MultiTenant
import skillo.candidate.Candidate

/**
 * Document
 * A domain class describes the data object and it's mapping to the database
 */
@MultiTenant
class Document {

    String filename
    Date uploadDate = new Date()
    Long candidateId
    byte[] filedata
    long fileSize
    String type
    String humanReadableSize


    static mapping = {
    }

    static belongsTo =Candidate

    static constraints = {
        filedata(nullable: false,maxSize: 10485760) // max of 10 mb
    }

}
