<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalDetails" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detalles del rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <label class="text-muted">Nombre:</label>
                            <p class="mb-0 font-weight-bold" ng-bind="roleActive.name"></p>
                        </div>
                        <div class="col">
                            <label class="text-muted form-label">Status:</label>
                            <p class="mb-0">
                                <span class="badge text-white" ng-bind="roleActive.status.name" ng-class="roleActive.status.name === 'Activo' ? 'bg-success' : 'bg-secondary'"></span>
                            </p>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>