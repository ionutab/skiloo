package skilloo

class NoteType {
    
    String code
    Boolean important

    static constraints = {
        code blank: false
    }
}
