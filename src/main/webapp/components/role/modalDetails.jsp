<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalDetails" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <label class="text-muted">Nombre:</label>
                            <span class="form-text" ng-bind="roleDetails.name"></span>
                        </div>
                        <div class="col">
                            <label class="text-muted">Status:</label>
                            <span class="form-text" ng-bind="roleDetails.status.name"></span>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>