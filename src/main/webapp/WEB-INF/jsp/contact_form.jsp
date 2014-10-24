<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp"
  title="Contact Information" currentSection="ContactList">
  <s:layout-component name="body">
    <s:form beanclass="${actionBean.class}">
      <div><s:hidden name="contact"/></div>
      <table class="form">
        <tr>
          <td><s:label for="contact.email"/>:</td>
          <td>
            <s:text name="contact.email" class="required"/>
          </td>
          <td class="error"><s:errors field="contact.email"/></td>
        </tr>
        <tr>
          <td>
            <s:label for="contact.firstName"/>:
          </td>
          <td><s:text name="contact.firstName"/></td>
          <td class="error"><s:errors field="contact.firstName"/></td>
        </tr>
        <tr>
          <td>
            <s:label for="contact.lastName"/>:
          </td>
          <td><s:text name="contact.lastName"/></td>
          <td class="error"><s:errors field="contact.lastName"/></td>
        </tr>
        <tr>
          <td>
            <s:label for="contact.phoneNumber"/>:
          </td>
          <td>
            <s:text name="contact.phoneNumber" formatType="dashes"/>
          </td>
          <td class="error"><s:errors field="contact.phoneNumber"/></td>
        </tr>
        <tr>
          <td>
            <s:label for="contact.birthDate"/>:
          </td>
          <td>
            <s:text name="contact.birthDate"
              formatPattern="yyyy-MM-dd"/>
          </td>
          <td class="error"><s:errors field="contact.birthDate"/></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
            <s:submit name="save" value="Save"/>
            <s:submit name="cancel" value="Cancel"/>
          </td>
        </tr>
      </table>
    </s:form>
  </s:layout-component>
</s:layout-render>
