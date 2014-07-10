<div id="displayCandidate">

    <div class="box-header">
        <h3 class="box-title">${CandidateShow.firstName} ${CandidateShow.lastName}</h3>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12">
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-pencil append-icon"></i> Edit</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-star append-icon"></i> Star</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-plus-square append-icon"></i>&nbsp;Add to</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-print append-icon"></i>&nbsp;PDF</a>
            </div>

        </div>
        <br/>

        %{--MAIN TRADE--}%
        <g:if test="${CandidateShow.getMainTrade()?.isExpired()}">
            <p class="text-red"><b>${
                     CandidateShow.getMainTrade()?.qualification.name +
                    (CandidateShow.getMainTrade()?.number != null ? " " + CandidateShow.getMainTrade()?.number : "" ) +
                    (CandidateShow.getMainTrade()?.expiryDate != null ? " " + CandidateShow.getMainTrade()?.expiryDate : "")
            }</b></p>
        </g:if>
        <g:if test="${CandidateShow.getMainTrade()?.willExpireSoonerThan(60)}">
            <p class="text-yellow"><b>${
                CandidateShow.getMainTrade()?.qualification.name +
                        (CandidateShow.getMainTrade()?.number != null ? " " + CandidateShow.getMainTrade()?.number : "" ) +
                        (CandidateShow.getMainTrade()?.expiryDate != null ? " " + CandidateShow.getMainTrade()?.expiryDate : "")
            }</b></p>
        </g:if>
        <g:if test="${CandidateShow.getMainTrade()?.isMoreThenTwoMonthsValid()}">
            <p class="text-yellow"><b>${
                CandidateShow.getMainTrade()?.qualification.name +
                        (CandidateShow.getMainTrade()?.number != null ? " " + CandidateShow.getMainTrade()?.number : "" ) +
                        (CandidateShow.getMainTrade()?.expiryDate != null ? " " + CandidateShow.getMainTrade()?.expiryDate : "")
            }</b></p>
        </g:if>
        <g:each in="${CandidateShow.candidateQualifications}" var="cq" >
            <g:if test="${cq.isMainTrade == false}" >
                <g:if test="${cq.isExpired()}">
                    <p class="text-red">${
                        cq.qualification.name +
                        (cq.number != null ? " " + cq.number : "" ) +
                        (cq.expiryDate != null ? " " + cq.expiryDate : "")
                    }</p>
                </g:if>
                <g:if test="${cq.willExpireSoonerThan(60)}">
                    <p class="text-yellow">${
                        cq.qualification.name +
                                (cq.number != null ? " " + cq.number : "" ) +
                                (cq.expiryDate != null ? " " + cq.expiryDate : "")
                    }</p>
                </g:if>
                <g:if test="${cq.isMoreThenTwoMonthsValid()}">
                    <p class="text-yellow">${
                        cq.qualification.name +
                                (cq.number != null ? " " + cq.number : "" ) +
                                (cq.expiryDate != null ? " " + cq.expiryDate : "")
                    }</p>
                </g:if>
            </g:if>
        </g:each>

        <div class="row">
            <div class="col-sm-3">
                <label><i class="fa fa-phone"></i></label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.telephoneNumber}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.email.label" />:</label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.email}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.carOwner.label" />:</label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.carOwner == true ? 'Yes' : 'No'}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.birthDate.label" />:</label>
            </div>

            <div class="col-sm-3">
                <p><g:formatDate date="${CandidateShow.birthDate}" /></p>
            </div>

            <div class="col-sm-3">
                <label><g:message code="candidate.age.label" />:</label>
            </div>

            <div class="col-sm-3">
                <p>${CandidateShow.age()}</p>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.consultant.label" />:</label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.consultant?.firstName + ' ' + CandidateShow.consultant?.lastName }</p>
            </div>
        </div>
        %{--
        <div class="row">
            <div class="col-sm-3">
                <label>Rating</label>
            </div>

            <div class="col-sm-9">
                <i class="fa fa-star text-yellow fa-fw"></i>
                <i class="fa fa-star text-success fa-fw"></i>
                <i class="fa fa-star text-green fa-fw"></i>
                <i class="fa fa-star vd_yellow fa-fw"></i>
                <i class="fa fa-star vd_yellow fa-fw"></i>
            </td>

            </div>
        </div>
        --}%
    </div>
</div>