/**
 * Pimcore
 *
 * This source file is available under two different licenses:
 * - GNU General Public License version 3 (GPLv3)
 * - Pimcore Enterprise License (PEL)
 * Full copyright and license information is available in
 * LICENSE.md which is distributed with this source code.
 *
 * @copyright  Copyright (c) 2009-2016 pimcore GmbH (http://www.pimcore.org)
 * @license    http://www.pimcore.org/license     GPLv3 and PEL
 */

pimcore.registerNS("pimcore.layout.portlets.modifiedDocuments");
pimcore.layout.portlets.modifiedDocuments = Class.create(pimcore.layout.portlets.abstract, {

    getType: function () {
        return "pimcore.layout.portlets.modifiedDocuments";
    },

    getName: function () {
        return t("modified_documents");
    },

    getIcon: function () {
        return "pimcore_icon_document";
    },

    getLayout: function (portletId) {

        var store = new Ext.data.Store({
            autoDestroy: true,
            proxy: {
                type: 'ajax',
                url: '/admin/portal/portlet-modified-documents',
                reader: {
                    type: 'json',
                    rootProperty: 'documents'
                }
            },
            fields: ['id','path',"type",'date']
        });

        store.load();

        var grid = Ext.create('Ext.grid.Panel', {
            store: store,
            columns: [
                {header: t('path'), sortable: false, dataIndex: 'path', flex: 1},
                {header: t('date'), width: 150, sortable: false, renderer: function (d) {
                    var date = new Date(d * 1000);
                    return Ext.Date.format(date,"Y-m-d H:i:s");
                }, dataIndex: 'date'}

            ],
            stripeRows: true,
            autoExpandColumn: 'path'
        });

        grid.on("rowclick", function(grid, record, tr, rowIndex, e, eOpts ) {
            var data = grid.getStore().getAt(rowIndex);

            pimcore.helpers.openDocument(data.data.id, data.data.type);
        });

        this.layout = Ext.create('Portal.view.Portlet', Object.extend(this.getDefaultConfig(), {
            title: this.getName(),
            iconCls: this.getIcon(),
            height: 275,
            layout: "fit",
            items: [grid]
        }));

        this.layout.portletId = portletId;
        return this.layout;
    }
});
