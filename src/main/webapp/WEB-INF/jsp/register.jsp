<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<%-- START:password --%>
<s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
  title="Registration">
  <s:layout-component name="body">
  <%-- START:globalErrorsOnly --%>
    <p>Register to create an account:</p>
<%-- END:password --%>
    <s:errors globalErrorsOnly="true"/>
<%-- START:password --%>
<%-- START:wizard1 --%>
    <s:form beanclass="es.unileon.action.RegisterActionBean">
  <%-- END:globalErrorsOnly --%>
      <table class="form">
<%-- END:wizard1 --%>
        <!-- s:text fields for first, last and user name... -->
<%-- END:password --%>
<%-- START:wizard1 --%>
        <!-- input fields... -->
<%-- END:wizard1 --%>
        <tr>
          <td><s:label for="user.firstName"/>:</td>
          <td><s:text name="user.firstName"/></td>
        </tr>
        <tr>
          <td><s:label for="user.lastName"/>:</td>
          <td><s:text name="user.lastName"/></td>
        </tr>
        <tr>
          <td><s:label for="user.username"/>:</td>
          <td><s:text name="user.username"/></td>
          <td>@unileon.es</td>
        </tr>
        <%-- START:password --%>
        <tr>
          <td><s:label for="user.password"/>:</td>
          <td><s:password name="user.password"/></td>
        </tr>
        <tr>
          <td><s:label for="confirmPassword"/>:</td>
          <td><s:password name="confirmPassword"/></td>
        </tr>
        <!-- rest of the form... -->
        <%-- END:password --%>
        <tr>
          <td><s:label for="numberOfAliases"/>:</td>
          <td>
            
            <s:select name="numberOfAliases">
              <s:option value="" label="How many aliases?"/>
              <c:forEach  begin="${actionBean.minAliases}"
                var="index" end="${actionBean.maxAliases}">
                <s:option value="${index}" label="${index}"/>
              </c:forEach>
            </s:select>
            
          </td>
        </tr>
<%-- START:wizard1 --%>
        <tr>
          <td></td>
          <td>
            <s:submit name="register" value="Continue"/>
            <s:submit name="cancel" value="Cancel"/>
          </td>
        </tr>
<%-- START:password --%>
      </table>
    </s:form>
<%-- END:wizard1 --%>
  </s:layout-component>
</s:layout-render>
<%-- END:password --%>
