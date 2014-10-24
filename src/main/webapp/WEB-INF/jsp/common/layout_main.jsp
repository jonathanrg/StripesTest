<!--
 ! Excerpted from "Stripes: and Java Web Development is Fun Again",
 ! published by The Pragmatic Bookshelf.
 ! Copyrights apply to this code. It may not be used to create training material, 
 ! courses, books, articles, and the like. Contact us if you are in doubt.
 ! We make no guarantees that this code is fit for any purpose. 
 ! Visit http://www.pragmaticprogrammer.com/titles/fdstr for more book information.
-->
<%@page contentType="text/html;charset=ISO-8859-1" language="java"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<s:layout-definition>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
  <html>
    <head>
      <title>${title}</title>
      <link rel="stylesheet" type="text/css"
        href="${contextPath}/css/style.css">
    </head>

    <body>
      <div id="panel">
        
        <div id="header">
          <span class="title">${title}</span>
          <span class="menu">
            <s:layout-component name="menu">
              Welcome to Stripes Webmail
            </s:layout-component>
          </span>
        </div>
        

        <s:messages/>

        
        <div id="body">
          <s:layout-component name="body"/>
        </div>
        

        <div class="clear"></div>

        <div id="footer">
          <div class="padded">
            Footer goes here.

            <!-- View source links just for convenience -->
            | Source:
            <s:link beanclass="es.unileon.action.ViewSourceActionBean">
              <s:param name="filename" value="<%= request.getRequestURI() %>"/>
              JSP
            </s:link> |
            <s:link beanclass="es.unileon.action.ViewSourceActionBean">
              <s:param name="filename" value="${actionBean.class.name}"/>
              Action Bean
            </s:link>
          </div>
        </div>
      </div>
    </body>
  </html>
</s:layout-definition>
