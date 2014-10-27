<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/jsp/common/layout_menu.jsp"
  title="Contact List" currentSection="ContactList">
  <s:layout-component name="body">
    <s:link beanclass="es.unileon.action.ContactFormActionBean">
      Create a New Contact
    </s:link>
    <br/>
    <d:table name="${actionBean.contacts}" id="contact" requestURI=""
      defaultsort="1" pagesize="10">
      <d:column title="Last name" property="lastName"
        sortable="true"/>
      <d:column title="First name" property="firstName"
        sortable="true"/>
      <d:column title="Email" property="email" sortable="true"/>
      <d:column title="Action">
        <s:link beanclass="es.unileon.action.ContactListActionBean"
          event="view">
          <s:param name="contact" value="${contact}"/>
          View
        </s:link> |
        <s:link beanclass="es.unileon.action.ContactFormActionBean">
          <s:param name="contact" value="${contact}"/>
          Update
        </s:link> |
        <s:link beanclass="es.unileon.action.ContactListActionBean"
          event="delete"
          onclick="return confirm('Delete ${contact}?');">
          <s:param name="contact" value="${contact}"/>
          Delete
        </s:link>
      </d:column>
    </d:table>
  </s:layout-component>
</s:layout-render>
