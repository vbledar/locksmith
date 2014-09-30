package org.locksmith.location

class Area {

    String name

    static constraints = {
        name (nullable: false)
    }

    static def getAllAreas() {
        return Area.findAll()
    }
}
