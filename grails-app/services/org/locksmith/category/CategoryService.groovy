package org.locksmith.category

class CategoryService {

    /**
     * Retrieves and returns the parent categories found in the database.
     *
     * @param params list of request parameters (not used)
     */
    def findParentCategories(def params) {
        def criteria = Category.createCriteria()
        def parentCategories = criteria.list {
            isNull ('parent')

            order('ordering', 'asc')
        }

    }

    /**
     * Retrieves and returns the child categories found in the database.
     *
     * @param params list of request parameters
     * @param count defines if a count of total returned rows should be done
     */
    def findChildCategories(def params, boolean count) {
        def criteria = Category.createCriteria()
        def childCategories = criteria.list {
            // set max number of results
            if (params.max) {
                maxResults(Integer.parseInt(params.max))
            } else {
                maxResults(10)
            }

            // set offset number of results
            if (params.offset) {
                firstResult(Integer.parseInt(params.offset))
            } else {
                firstResult(0)
            }

            // parent category defined
            Category parent = Category.get(params.getLong('parent'));
            if (parent) {
                eq('parent', parent)
            } else {
                isNotNull('parent')
            }

            if (count) {
                // a count of rows has been requested
                projections {
                    rowCount()
                }
            } else {
                // by default order by ordering
                order('parent', 'asc')
                order('ordering', 'asc')
            }
        }
    }

    /**
     * Persist category in database
     *
     * @param category the instance to persist
     * @param params list of parameters (not used)
     *
     * @return true if instance is persisted successfully, false,
     * otherwise
     */
    Boolean createOrUpdateCategory(Category category, def params) {
        // remove errors from previous validation
        category.errors = null

        log.error ('Parent parameter is: ' + params.parent);

        if (params.parent && !"null".equalsIgnoreCase(params.parent)) {
            // attach selected parent to category
            Category parent = Category.get(params.long('parent'))
            category.parent = parent
        } else {
            // set parent to null since none was created
            category.parent = null
        }

        // persist the entity
        if (!category.save()) {
            log.error 'Failed to create category.'
            category.errors.each {
                log.error it
            }
            return false
        }
        return true
    }

    Boolean deleteCategory(Category category) {
        if (!category) {
            log.error 'Category is null. Cannot delete null!!!'
            return false
        }
        category.delete()
        return true
    }
}
