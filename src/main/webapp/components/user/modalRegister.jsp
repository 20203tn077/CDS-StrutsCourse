<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalRegister" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Registrar usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form ng-submit="createUser()" id="formUserRegister" name="formUserRegister">
                    <div class="row">
                        <div class="col-12">
                            <h5>Datos personales</h5>
                            <hr>
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Nombre: <b>*</b></label>
                            <input ng-model="userActive.person.name" name="name" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Primer apellido: <b>*</b></label>
                            <input ng-model="userActive.person.surname" name="surname" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Segundo apellido:</label>
                            <input ng-model="userActive.person.lastname" name="lastname" type="text" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Fecha de nacimiento: <b>*</b></label>
                            <input ng-model="userActive.person.birthdate" name="birthdate" type="date" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Teléfono: <b>*</b></label>
                            <input ng-model="userActive.person.phone" name="phone" type="phone" class="form-control" minlength="10" maxlength="11" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12">
                            <h5>Datos del usuario</h5>
                            <hr>
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Correo electrónico: <b>*</b></label>
                            <input ng-model="userActive.email" name="email" type="email" class="form-control" minlength="2" maxlength="100" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Contraseña: <b>*</b></label>
                            <input ng-model="userActive.password" name="password" type="password" class="form-control" minlength="2" maxlength="45" required ng-model="registerRoleName">
                        </div>
                        <div class="col-12 col-md-6 col-xl-4 mb-3">
                            <label>Status: <b>*</b></label>
                            <select ng-model="userActive.status" name="status" class="form-control" ng-options="status.name for status in statuses track by status.id" required>
                                <option value="">Selecciona una opción...</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label>Roles:</label>
                            <div class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <div class="row" ng-repeat="role in rolesSelectable">
                                        <div class="col-12 mb-2">
                                            <div class="card shadow-sm">
                                                <div class="card-body p-2">
                                                    <div class="row">
                                                        <div class="col text-center align-self-center">
                                                            <span ng-bind="role.name"></span>
                                                        </div>
                                                        <div class="col-auto">
                                                            <button ng-click="selectRole(role.id)" type="button" class="btn btn-outline-success font-weight-bold">></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <div class="row" ng-repeat="role in userActive.roles">
                                        <div class="col-12 mb-2">
                                            <div class="card shadow-sm">
                                                <div class="card-body p-2">
                                                    <div class="row">
                                                        <div class="col-auto">
                                                            <button ng-click="removeRole(role.id)" type="button" class="btn btn-outline-danger font-weight-bold"><</button>
                                                        </div>
                                                        <div class="col text-center align-self-center">
                                                            <span class="text-success font-weight-bold" ng-bind="role.name"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" form="formUserRegister" class="btn btn-success">Registrar</button>
            </div>
        </div>
    </div>
</div>