<!-- Modal Add Cart -->
<div class="modal fade" tabindex="-1" id="modal-import">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Data Buku</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" name="file" aria-label="Close" accept=".xls,.xlsx"></button>
            </div>
            <div class="modal-body">
                <!-- Form Import Data -->
                <form action="/book-import" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <label for="" class="col-sm-2 col-form-label">File</label>
                        <div class="row col-sm-10">
                            <input type="file" class="form-control" name="file">
                            <a href="template_import_buku.xlsx">Template Import</a>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="" class="col-sm-2 col-form-label"></label>
                        <div class="row col-sm-10">
                            <button type="submit" class="btn btn-primary">Import</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>