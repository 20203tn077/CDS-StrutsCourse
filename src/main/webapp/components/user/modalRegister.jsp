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
                        <div class="col-12">
                            <h5>Datos personales</h5>
                            <hr>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Nombre: <b>*</b></label>
                            <input ng-model="user.person.name" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName" required>
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Primer apellido: <b>*</b></label>
                            <input ng-model="user.person.surname" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName" required>
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Segundo apellido: <b>*</b></label>
                            <input ng-model="user.person.lastname" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Teléfono: <b>*</b></label>
                            <input ng-model="user.person.phone" type="phone" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName" required>
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Fecha de nacimiento: <b>*</b></label>
                            <input ng-model="user.person.birthdate" type="date" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName" required>
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <h5>Datos del usuario</h5>
                            <hr>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Correo electrónico: <b>*</b></label>
                            <input ng-model="user.email" type="email" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Contraseña: <b>*</b></label>
                            <input ng-model="user.password" type="password" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                            <span class="invalid-feedback">Wenas</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label>Status: <b>*</b></label>
                            <select ng-model="role.status" class="form-control" ng-options="status.name for status in statuses track by status.id" required>
                                <option value="">Selecciona una opción...</option>
                            </select>
                            <span class="invalid-feedback">sdfsdfsdf</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <table class="table table-striped">
                                <thead>
                                <tr class="text-center">
                                    <th scope="col">#</th>
                                    <th scope="col">Rol</th>
                                    <th scope="col">Asignar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="role in roles" class="text-center">
                                    <th ng-bind="$index + 1"></th>
                                    <td ng-bind="role.name"></td>
                                    <td>
                                        <span class="badge text-white" ng-bind="role.status.name" ng-class="role.status.name === 'Activo' ? 'bg-success' : 'bg-secondary'"></span>
                                    </td>
                                    <td>
                                        <button class="btn btn-primary" ng-click="showDetails(role.id)">Detalles</button>
                                        <button class="btn btn-primary" ng-click="showUpdate(role.id)">Modificar</button>
                                        <button class="btn btn-danger" ng-click="showDelete(role.id)">Eliminar</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
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