<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalUpdate" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modificar rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form ng-submit="updateRole()" id="formRoleUpdate" name="formRoleUpdate">
                    <div class="row">
                        <div class="col">
                            <label>Nombre: <b>*</b></label>
                            <input type="text" name="name" class="form-control" required ng-model="roleActive.name">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" form="formRoleUpdate" class="btn btn-primary">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>