<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalRegister" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form ng-submit="createRole()" id="formRoleRegister">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <label>Nombre: <b>*</b></label>
                            <input ng-model="role.name" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Status: <b>*</b></label>
                            <select ng-model="role.status" class="form-control" ng-options="status.name for status in statuses track by status.id" required>
                                <option value="">Selecciona una opción...</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" form="formRoleRegister" class="btn btn-primary">Registrar</button>
            </div>
        </div>
    </div>
</div>