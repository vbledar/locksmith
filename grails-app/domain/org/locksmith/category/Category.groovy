package org.locksmith.category

class Category {

    String name // category name
    String description // category description

    Integer ordering // category order parameter

    static hasMany = [children: Category] // children of category

    static hasOne = [parent: Category] // parent of category

    static constraints = {
        name (nullable: false, minSize: 3, maxSize: 50)
        description (nullable: false, minSize: 5, maxSize: 500)
        ordering (nullable: false)
        parent (nullable: true)
        children (nullable: true)
    }

    static mapping = {
        children sort: 'ordering', order: 'asc'
    }

    /**
     * Determines if this category is a parent category
     *
     * @return true if this category is parent, false, otherwise
     */
    def isParentCategory() {
        if (parent) {
            return false
        }
        return true
    }

    /**
     * Determines if this category has children
     *
     * @return true if this category has children, false, otherwise
     */
    def hasChildren() {
        if (!children || children.isEmpty())
            return false
        return true
    }

    /**
     * Retrieves all parent categories
     *
     * @return list of parent categories
     */
    static def getParentCategories() {
        return Category.findAllByParentIsNull();
    }

    /**
     * Overwritten toString method from java.lang.Object
     *
     * @return the required string representation of this object
     */
    @Override
    String toString() {
        StringBuilder sb = new StringBuilder()
        if (parent) {
            sb.append parent?.name
            sb.append(" - ")
        }
        sb.append this.name
        sb.toString()
    }
}
