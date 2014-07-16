<%@ page import="skillo.Candidate" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <r:require modules="forms" />
</head>

<body>
<div class="row">
<div class="col-md-5">
    <div class="box box-solid">
        <div class="box-body">
            <g:form controller="candidate" action="save" class="form form-horizontal" autocomplete="off" name="candidateCreateForm" id="candidateCreateForm">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'firstName', 'has-error')}">
                            <label for="firstName" class="col-md-3 control-label">
                                <g:message code="candidate.firstName.label" default="First Name" />
                            </label>
                            <div class="col-md-9">
                                <g:textField class="form-control" id="firstName" name="candidate.firstName" value="${candidateInstance?.firstName}" />
                                <g:eachError var="err" bean="${candidateInstance}" field="firstName">
                                    <g:if test="${err.code == 'matches.invalid'}">
                                        <span class="control-label"><g:message code="custom.invalid.name.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'nullable'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                            <g:javascript>
                                $("#firstName").change(function() {
                                    remoteCandidateCreateForm()
                                });
                            </g:javascript>
                        </div>

                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'lastName', 'has-error')}">
                            <label for="lastName" class="col-md-3 control-label">
                                <g:message code="candidate.lastName.label" default="Last Name" />
                            </label>

                            <div class="col-md-9">
                                <g:textField class="form-control" id="lastName" name="candidate.lastName" value="${candidateInstance?.lastName}" />
                                <g:eachError var="err" bean="${candidateInstance}" field="lastName">
                                    <g:if test="${err.code == 'matches.invalid'}">
                                        <span class="control-label"><g:message code="custom.invalid.name.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'nullable'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                            <g:javascript>
                                $("#lastName").change(function() {
                                    remoteCandidateCreateForm()
                                });
                            </g:javascript>
                        </div>

                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'birthDate', 'has-error')}">
                            <label for="candidate.birthDate" class="col-md-3 control-label">
                                <g:message code="candidate.birthDate.label" default="Birth Date" />
                            </label>

                            <div class="col-md-9">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <g:field type="textField" name="candidate.birthDate" id="candidateBirthDate" class="form-control datepicker" value="${formatDate(date: candidateInstance?.birthDate)}" default="none" />
                                    <g:javascript>
                                        $("#candidateBirthDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                                    </g:javascript>
                                </div><!-- /.input group -->
                                <g:eachError var="err" bean="${candidateInstance}" field="birthDate">
                                    <g:if test="${err.code == 'nullable'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'custom.invalid.date'}">
                                        <span class="control-label"><g:message code="custom.invalid.date.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="telephoneNumber" class="col-md-3 control-label">
                                <g:message code="candidate.telephoneNumber.label" default="Telephone Number" />
                            </label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <g:textField type="tel" id="telephoneNumber" name="candidate.telephoneNumber" class="form-control" value="${candidateInstance?.telephoneNumber}" />
                                    <g:javascript>
                                        $("#telephoneNumber").inputmask("99999-999-999", {"placeholder":"_____-___-___"});
                                    </g:javascript>
                                </div>
                            </div>
                            <g:javascript>

                                $("#telephoneNumber").change(function() {
                                    remoteCandidateCreateForm()
                                });

                            </g:javascript>
                        </div>

                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'address.details', 'has-error')} ">
                            <label for="address.details" class="col-md-3 control-label">
                                <g:message code="candidate.address.label" default="Address" />
                            </label>
                            <div class="col-md-9">
                                <g:textArea rows="2" name="address.details" id="address.details" class="form-control" value="${candidateInstance?.address?.details}" />
                                <g:eachError var="err" bean="${candidateInstance}" field="address.details">
                                    <g:if test="${err.code == 'nullable'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="postCode.id" class="col-md-3 control-label">
                                <g:message code="postCode.code.label" default="Post Code" />
                            </label>
                            <div class="col-md-9">
                                <g:hiddenField
                                        name="postCode.id"
                                        id="postCodeId"
                                        value="${candidateInstance?.address?.postCode?.id}"
                                />
                                <g:hiddenField
                                        name="postCode.previousCode"
                                        id="postCodePlaceholder"
                                        value="${candidateInstance?.address?.postCode?.code} - ${candidateInstance?.address?.postCode?.country}"
                                />

                                <g:javascript>
                                        function formatPostCodeSelection(item) {
                                            return item.code + ' - ' + item.country;
                                        };

                                        function formatPostCodeResult(item) {
                                            return item.code + ' - ' + item.country;
                                        };
                                        function doWeHaveAPostCodeAlready(){
                                            return "Search for a Post Code";
                                        }
                                        $("#postCodeId").select2({
                                            placeholder: doWeHaveAPostCodeAlready,
                        //                                  VERY IMPORTANT
                                            minimumInputLength: 4,
                                            ajax:{
                                                url: '<g:createLink controller="postCode" action="getPostCodes" />',
                                                dataType: 'json',
                                                data: function(term, page){
                                                    return {inputCode: term};
                                                },
                                                results: function (data, page) {
                                                    return {results: data};
                                                }
                                            },
                                            initSelection: function(element, callback) {
                                                var id=$("#postCodeId").val();
                                                if (id!=="") {
                                                    $("#s2id_postCodeId .select2-chosen").html($("#postCodePlaceholder").val());
                                                }
                                            },
                                            formatSelection: formatPostCodeSelection,
                                            formatResult: formatPostCodeResult,
                                            escapeMarkup: function (m) { return m; }
                                        });
                                </g:javascript>
                                <g:javascript>

                                    $("#postCodeId").change(function() {
                                        remoteCandidateCreateForm()
                                    });

                                </g:javascript>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'email', 'has-error')}">
                            <label for="candidate.email" class="col-md-3 control-label">
                                <g:message code="candidate.email.label" default="Email" />
                            </label>
                            <div class="col-md-9">
                                <g:field type="text" name="candidate.email" class="form-control" value="${candidateInstance?.email}" />
                                <g:eachError var="err" bean="${candidateInstance}" field="email">
                                    <g:if test="${err.code == 'email.invalid'}">
                                        <span class="control-label" >
                                            <g:message code="custom.invalid.email.message"/>
                                        <span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'has-error')}">
                            <label for="candidateMainTrade.id" class="col-md-3 control-label">
                                <g:message code="candidate.mainTrade.label" default="Main Trade" />
                            </label>
                            <div class="col-md-9">
                                <g:hiddenField
                                        name="candidateMainTrade.id"
                                        id="mainTradeId"
                                        class="form-control"
                                        value="${candidateInstance?.candidateQualifications?.asList()?.first()?.qualification?.id}"
                                />
                                <g:javascript>
                                    function formatCandidateQualification(item) { return item.name; };
                                    $("#mainTradeId").select2({
                                            data: {results:${AvailableMainTrades}, text:'name'},
                                            formatSelection: formatCandidateQualification,
                                            formatResult: formatCandidateQualification,
                                            placeholder: "Select a Qualification",
                                            allowClear:true
                                        }
                                    );
                                </g:javascript>
                                <g:eachError var="err" bean="${candidateInstance}" field="candidateQualifications">
                                    <g:if test="${err.code == 'nullable'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.driver" class="col-md-3 control-label">Driver</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.driver" value="${candidateInstance?.driver}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.sponsored" class="col-md-3 control-label">Sponsored</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.sponsored" value="${candidateInstance?.sponsored}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.carOwner" class="col-md-3 control-label">Car owner</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.carOwner" value="${candidateInstance?.carOwner}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="col-md-offset-3">
                            <g:submitButton name="Finish" class="btn btn-success" />
                            %{--<g:actionSubmit value="Save And Edit" action="two" class="btn btn-success" />--}%
                            <g:link uri="/" class="btn btn-warning" name="Cancel">Cancel</g:link>
                        </div>

                    </div>

                </div>
            </g:form>
        </div>
    </div>
</div>

<g:javascript>
/*
    function remoteCandidateCreateForm(){

        $.ajax({
            url: "http://localhost:8080/skillo/candidate/findMatches",
            dataType: 'json',
            method:'GET',
            data: $('form#candidateCreateForm').serialize()
        }).done(function(){
            alert('done')
        }).fail(function(){
            alert('fail');
        });
    }
*/

function remoteCandidateCreateForm(){

    $.ajax({
        url: "${createLink( controller: 'candidate', action: 'findMatches')}",
        type: 'POST',
        data: $('form#candidateCreateForm').serialize(),
        success: function (data) {
            $("#candidateMatches").empty().append(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $("#candidateMatches").html(jqXHR.responseText);
        }
    });
}
</g:javascript>
<g:render template="matches" />
</div>
</body>
</html>
