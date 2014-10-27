<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<%-- START:selectBox --%>
<jsp:useBean class="es.unileon.view.FoldersViewHelper" id="folders"/>
<%-- END:selectBox --%>
<div id="action">
  <s:submit name="delete" value="Delete"/>
<%-- START:selectBox --%>
  Move to folder:
  <s:select name="selectedFolder">
    <s:option value="">Select a folder...</s:option>
    <s:options-collection collection="${folders.folders}"
      value="id" label="name"/>
  </s:select>
  <s:submit name="moveToFolder" value="Move"/>
  <s:errors field="selectedFolder"/>
<%-- END:selectBox --%>
</div>
