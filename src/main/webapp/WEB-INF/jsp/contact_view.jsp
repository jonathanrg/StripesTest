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
    <table class="view">
      <tr>
        <td class="label"><s:label for="contact.firstName"/>:</td>
        <td class="value">${actionBean.contact.firstName}</td>
      </tr>
      <tr>
        <td class="label"><s:label for="contact.lastName"/>:</td>
        <td class="value">${actionBean.contact.lastName}</td>
      </tr>
      <tr>
        <td class="label"><s:label for="contact.email"/>:</td>
        <td class="value">${actionBean.contact.email}</td>
      </tr>
      <tr>
        <td class="label"><s:label for="contact.phoneNumber"/>:</td>
        <td class="value">
          <s:format formatType="dashes"
             value="${actionBean.contact.phoneNumber}"/>
        </td>
      </tr>
      <tr>
        <td class="label"><s:label for="contact.birthDate"/>:</td>
        <td class="value">
          <s:format value="${actionBean.contact.birthDate}"
            formatPattern="yyyy-MM-dd"/>
        </td>
      </tr>
    </table>
    <p>
      <s:link beanclass="stripesbook.action.ContactFormActionBean">
        <s:param name="contact" value="${actionBean.contact}"/>
        Update
      </s:link> |
      <s:link beanclass="stripesbook.action.ContactListActionBean">
        Back to List
      </s:link>
    </p>
  </s:layout-component>
</s:layout-render>
