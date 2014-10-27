<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
  title="Registration">
  <s:layout-component name="body">
<%-- START:this --%>
    <p>Enter your email aliases:</p>
    <s:form beanclass="es.unileon.action.RegisterActionBean">
      <s:errors/>
      <table class="form">
        <c:forEach begin="0" end="${actionBean.numberOfAliases - 1}"
          var="index">
          <tr>
            <td>
              <s:label for="user.aliases[${index}]"/> ${index + 1}:
            </td>
            <td><s:text name="user.aliases[${index}]"/></td>
            <td>@stripesbook.org</td>
          </tr>
        </c:forEach>
        <tr>
          <td></td>
          <td>
            <s:submit name="save" value="Continue"/>
            <s:submit name="cancel" value="Cancel"/>
          </td>
        </tr>
      </table>
    </s:form>
<%-- END:this --%>
  </s:layout-component>
</s:layout-render>
