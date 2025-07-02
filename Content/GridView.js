(function() {
    function onGridViewInit(s, e) {
        AddAdjustmentDelegate(adjustGridView);
        updateToolbarButtonsState();
    }
    function onGridViewSelectionChanged(s, e) {
        updateToolbarButtonsState();
    }
    function adjustGridView() {
        gridView.AdjustControl();
    }
    function updateToolbarButtonsState() {
        var enabled = gridView.GetSelectedRowCount() > 0;
        MainContent.GetItemByName("Delete").SetEnabled(enabled);
        MainContent.GetItemByName("Export").SetEnabled(enabled);

        MainContent.GetItemByName("Edit").SetEnabled(gridView.GetFocusedRowIndex() !== -1);
    }
    function onToolbarItemClick(s, e) {
        switch(e.item.name) {
            case 'CustomExportToXLSX':
                e.processOnServer = true;
                e.usePostBack = true;
                break;
            case 'CustomExportToDOCX':
                e.processOnServer = true;
                e.usePostBack = true;
                break;
            case 'CustomExportToPDF':
                e.processOnServer = true;
                e.usePostBack = true;
                break;
            case "New":
                gridView.AddNewRow();
                break;
            case "Edit":
                gridView.StartEditRow(gridView.GetFocusedRowIndex());
                break;
            case "Delete":
                deleteSelectedRecords();
                break;
            case "Refresh":
                gridView.Refresh();
                break;
        }
    }
    function onPageToolbarItemClick(s, e) {		
		switch(e.item.name) {
            case "ToggleFilterPanel":
                toggleFilterPanel();
                break;
            case "New":
                gridView.AddNewRow();
                break;
            case "Edit":
                gridView.StartEditRow(gridView.GetFocusedRowIndex());
                break;
            case "Delete":
                deleteSelectedRecords();
                break;
            case "Export":
                //for (var i = 0; i < gridView.GetColumnCount(); i++) console.log(gridView.GetColumn(i));
                //console.log(gridView);

                ////alert(gridView.GetColumnsCount());
                //for (var i = 0; i < gridView.GetColumnsCount(); i++) {
                //    if (gridView.GetColumn(i).fieldName != 'ID_Acopio')
                //    {
                //        gridView.GetColumn(i).visible = true;
                //        gridView.GetColumn(i).inCustWindow = false;
                //    }
                //}
                gridView.ExportTo(ASPxClientGridViewExportFormat.Xlsx);
                break;
        }
    }
    function deleteSelectedRecords() {
        if(confirm('Seguro que desea borrar lo seleccionado?')) {
            gridView.PerformCallback('delete');
        }
    }
    function onFiltersNavBarItemClick(s, e) {
        var filters = {
            All: "",
            Active: "[Status] = 1",
            Bugs: "[Kind] = 1",
            Suggestions: "[Kind] = 2",
            HighPriority: "[Priority] = 1"
        };
        gridView.ApplyFilter(filters[e.item.name]);
        HideLeftPanelIfRequired();
    }

    function toggleFilterPanel() {
        filterPanel.Toggle();
    }

    function onFilterPanelExpanded(s, e) {
        adjustPageControls();
        searchButtonEdit.SetFocus();
    }

    window.onGridViewInit = onGridViewInit;
    window.onGridViewSelectionChanged = onGridViewSelectionChanged;
    window.onPageToolbarItemClick = onPageToolbarItemClick;
    window.onFilterPanelExpanded = onFilterPanelExpanded;
    window.onFiltersNavBarItemClick = onFiltersNavBarItemClick;
    window.onToolbarItemClick = onToolbarItemClick;
})();