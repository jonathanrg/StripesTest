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
    <p>Register to create an account:</p>
    <form action="${contextPath}/Login.action">
      <table class="form">
        <tr>
          <td>First name:</td>
          <td><input type="text"/></td>
        </tr>
        <tr>
          <td>Last name:</td>
          <td><input type="text"/></td>
        </tr>
        <tr>
          <td>Primary email:</td>
          <td><input type="text"/></td>
          <td>@unileon.es</td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="text"/></td>
        </tr>
        <tr>
          <td>Confirm password:</td>
          <td><input type="text"/></td>
        </tr>
        <tr>
          <td>Aliases:</td>
          <td><select><option>How many aliases?</option></select></td>
        </tr>
        <tr>
          <td></td>
          <td>
            <input type="submit" value="Continue"/>
            <input type="submit" value="Cancel"/>
          </td>
        </tr>
      </table>
    </form>
  </s:layout-component>
</s:layout-render>
