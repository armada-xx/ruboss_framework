/*******************************************************************************
 * Copyright 2008, Ruboss Technology Corporation.
 *
 * This software is dual-licensed under both the terms of the Ruboss Commercial
 * License v1 (RCL v1) as published by Ruboss Technology Corporation and under
 * the terms of the GNU General Public License v3 (GPL v3) as published by the
 * Free Software Foundation.
 *
 * Both the RCL v1 (rcl-1.0.txt) and the GPL v3 (gpl-3.0.txt) are included in
 * the source code. If you have purchased a commercial license then only the
 * RCL v1 applies; otherwise, only the GPL v3 applies. To learn more or to buy a
 * commercial license, please go to http://ruboss.com.
 ******************************************************************************/
package org.ruboss.models {
  import mx.collections.ArrayCollection;

  /**
   * Adds a few handy methods to ArrayCollection class to simplify working 
   * with model objects.
   */
  public class ModelsCollection extends ArrayCollection {
    
    /** 
     * @see mx.collections.ArrayCollection
     */
    public function ModelsCollection(source:Array = null) {
      super(source);
    }

    /**
     * Attempts to find *first* object in the collection that has specified property key
     * and value
     *  
     * @param propertyName name of the property to look up
     * @param propertyValue value of the property
     *  
     * @return *first* object that matches or null
     */
    [Bindable("collectionChange")]
    public function withPropertyValue(propertyName:String, propertyValue:Object):Object {
      var index:int = indexOfPropertyValue(propertyName, propertyValue);
      return (index == -1) ? null : getItemAt(index);
    }
    
    /**
     * Looks up a model object in the collection by it's id. IDs are guaranteed to be unique.
     *  
     * @param id id of the model
     * @return model object with a given id
     */
    [Bindable("collectionChange")]
    public function withId(id:int):Object {
      var index:int = indexOfId(id);
      return (index == -1) ? null : getItemAt(index);
    }
    
    /**
     * Checks to see if a given model object is in the collection. Comparison done by IDs.
     *  
     * @param object model object
     * @return boolean result
     */
    public function hasItem(object:Object):Boolean {
      return withId(object["id"]) != null;
    }
    
    /**
     * Gets a model item reference. Search is performed by model id.
     *  
     * @param object object to find
     * @return object with the same id
     */
    [Bindable("collectionChange")]
    public function getItem(object:Object):Object {
      return withId(object["id"]);
    }
        
    /**
     * Sets a model item/ updates current reference if any
     *  
     * @param object object to add
     */
    public function setItem(object:Object):void {
      setItemAt(object, indexOfId(object["id"]));
    }
    
    /**
     * Removes given model instance (search done by id).
     *  
     * @param object object to remove
     */ 
    public function removeItem(object:Object):void {
      removeItemAt(indexOfId(object["id"]));
    }

    /**
     * Find index of the first item with a given property name/ value pair.
     *  
     * @param propertyName name of the property
     * @param propertyValue value of the property
     *  
     * @return index offset
     */
    public function indexOfPropertyValue(propertyName:String, propertyValue:Object):int {
      for (var i:int = 0; i < length; i++) {
        if (getItemAt(i)[propertyName] == propertyValue) return i;
      }
      return -1;
    }
    
    /**
     * Find index of the first item with a given id.
     *  
     * @param id of the model to find
     * @return index offset
     */
    public function indexOfId(id:int):int {
      return indexOfPropertyValue("id", id);
    }
  }
}