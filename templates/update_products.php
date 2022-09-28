<!-- Modal -->
<div class="modal fade" id="form_products" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="update_product_form" onsubmit="return false">
          <div class="form-row">
            <div class="form-group col-md-6">
              <input type="hidden" name="pid" id="pid" value=""/>
              <label>Date</label>
              <input type="text" class="form-control" name="added_date" id="added_date" value="<?php echo date("Y-m-d"); ?>" readonly/>
            </div>
            <div class="form-group col-md-6">
              <label>Product ID</label>
              <input type="text" class="form-control" name="product_id" id="product_id" placeholder="Enter Product ID" required>
            </div>
          </div>

          <div class="form-group">
            <label>Product Name</label>
            <input type="text" class="form-control" id="update_product" name="update_product" placeholder="Enter Product Name" required/>
          </div>

          <div class="form-group">
            <label>Category</label>
            <select class="form-control" id="select_cat" name="select_cat" required/>
            </select>
          </div>

          <div class="form-group">
            <label>Product Price</label>
            <input type="text" class="form-control" id="product_price" name="product_price" placeholder="Enter Price of Product" required/>
          </div>

          <div class="form-group">
            <label>Product Discount Price</label>
            <input type="text" class="form-control" id="product_dp" name="product_dp" placeholder="Enter Discount of Product" required/>
          </div>
          
          <button type="submit" class="btn btn-success">Update</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>