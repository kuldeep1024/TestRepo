Ext.application({
    name: 'HelloExt',
  /*requires: [
    'Ext.form.Panel'
  ],*/
    launch: function() {

	//var descAndSystem = new Ext.form.Panel ({  //if we use this we need requires :[]
	var descAndSystem = Ext.create('Ext.form.Panel',{
    region: 'center',
    layout: 'vbox',
    margins: '5 5 5 5',
    xtype: 'form',
    title: 'Some title',
    id: 'descAndSystem',
    width: '800', 
	height:'100',
    items: [
       { 	
			xtype: 'textarea',
			fieldLabel: 'Provide a description',
			name: 'rightdescription',
       },
       {
			xtype: 'combobox',
			fieldLabel: 'Choose System',
			store: ['A','B','C'],
			queryMode: 'local',
			displayField: 'name',
			valueField: 'name',
			name: 'system'
       }
    ]
});
	
	
	
	
	Ext.create('Ext.container.Viewport', {
    layout: 'border',
    id: 'wizardcontainer',
    items: [
        descAndSystem,
        {
            region: 'south', 
            layout: 'hbox',
            margins: '5 5 5 5',
            items: [
               { xtype: 'button', text: 'Back'  },
               { xtype: 'button', text: 'Next' },
               { xtype: 'button', text: 'Cancel', align: 'right', handler: function () { Ext.Msg.show ({title:'Abgebrochen geklickt.',msg:'Hello',buttons:Ext.Msg.YESNOCANCEL}); } }
            ]
        }
   ]
});
    }
});