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
  import org.ruboss.Ruboss;

  /**
   * Encapsulates properties common to all model objects and wraps around a few
   * Ruboss.models.* methods to shorten access.
   */
  [Bindable]
  public class RubossModel {
    private var _label:String;

    /** all models have an id. this is typically unique per class of models */
    public var id:int;

    /** true if this model has been *fully* fetched as opposed to just stubbed out */
    public var fetched:Boolean;

    /** any model can have one attachment */
    public var attachment:RubossFileReference;

    /**
     * @param label default model property to use when doing toString().
     */
    public function RubossModel(label:String = "id") {
      _label = label;
    }

    /**
     * Wrapper around Ruboss.models.show
     *  
     * @see org.ruboss.controllers.RubossModelsController#show
     *
     * @param optsOrAfterCallback if this is a Function or an IResponder, we treat it as a callback to invoke
     * when the service returns; otherwise, we treat it as an anonymous Object of key/value pairs which can be used to
     * clober the value of any subsequent parameters.
     * @param nestedBy an array of model instances that should used to nest this request under
     * @param metadata an object (a hash of key value pairs that should be tagged on to the request)
     * @param fetchDependencies if true model dependencies will be recursively fetched as well
     * @param useLazyModel if true dependencies marked with [Lazy] will be skipped (not fetched)
     * @param targetServiceId service provider to use
     */
    [Bindable(event="propertyChange")]
    public function show(optionsHashOrAfterCallback:Object = null, nestedBy:Array = null, metadata:Object = null,
      fetchDependencies:Boolean = true, useLazyMode:Boolean = false, targetServiceId:int = -1):Object {
      return Ruboss.models.show(this, optionsHashOrAfterCallback, nestedBy, metadata, 
        fetchDependencies, useLazyMode, targetServiceId);
    }

    /**
     * Wrapper around Ruboss.models.create
     *
     * @see org.ruboss.controllers.RubossModelsController#create
     * 
     * @param optsOrAfterCallback if this is a Function or an IResponder, we treat it as a callback to invoke
     * when the service returns; otherwise, we treat it as an anonymous Object of key/value pairs which can be used to
     * clober the value of any subsequent parameters.
     * @param nestedBy an array of model instances that should used to nest this request under
     * @param metadata an object (a hash of key value pairs that should be tagged on to the request)
     * @param targetServiceId service provider to use
     */
    public function create(optionsHashOrAfterCallback:Object = null, nestedBy:Array = null, metadata:Object = null,
      targetServiceId:int = -1):void {
      Ruboss.models.create(this, optionsHashOrAfterCallback, nestedBy, metadata, targetServiceId);
    }

    /**
     * Wrapper around Ruboss.models.update
     *
     * @see org.ruboss.controllers.RubossModelsController#update
     * 
     * @param optsOrAfterCallback if this is a Function or an IResponder, we treat it as a callback to invoke
     * when the service returns; otherwise, we treat it as an anonymous Object of key/value pairs which can be used to
     * clober the value of any subsequent parameters.
     * @param nestedBy an array of model instances that should used to nest this request under
     * @param metadata an object (a hash of key value pairs that should be tagged on to the request)
     * @param targetServiceId service provider to use
     */
    public function update(optionsHashOrAfterCallback:Object = null, nestedBy:Array = null, metadata:Object = null,
      targetServiceId:int = -1):void {
      Ruboss.models.update(this, optionsHashOrAfterCallback, nestedBy, metadata, targetServiceId);
    }

    /**
     * Wrapper around Ruboss.models.destroy
     *
     * @see org.ruboss.controllers.RubossModelsController#destroy
     * 
     * @param optsOrAfterCallback if this is a Function or an IResponder, we treat it as a callback to invoke
     * when the service returns; otherwise, we treat it as an anonymous Object of key/value pairs which can be used to
     * clober the value of any subsequent parameters.
     * @param nestedBy an array of model instances that should used to nest this request under
     * @param metadata an object (a hash of key value pairs that should be tagged on to the request)
     * @param targetServiceId service provider to use
     */
    public function destroy(optionsHashOrAfterCallback:Object = null, nestedBy:Array = null, metadata:Object = null,
      targetServiceId:int = -1):void {
      Ruboss.models.destroy(this, optionsHashOrAfterCallback, nestedBy, metadata, targetServiceId);
    }

    /**
     * Default toString implementation for models
     */
    public function toString():String {
      return this[_label] == null ? "" : this[_label].toString();
    }
  }
}