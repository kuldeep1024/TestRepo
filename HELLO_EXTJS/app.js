Ext.application({
    name: 'HelloExt',

    launch: function() {
        Ext.create('Ext.container.Viewport', {		
            layout: 'fit',
            items: [
				{
					xtype: 'container',
					height: 42,
					width: 250,
					items: [
					{
						xtype: 'textfield',
						fieldLabel: 'Name #',
						id: 'name',
						itemId:'nameI1'
					},
					{
						xtype: 'textfield',
						fieldLabel: 'Telephone #',
						//id: 'name',
						itemId:'nameI'
					},
					{
						xtype: 'button',
						text: 'Button',
						handler : function(){
							//alert('Hello : '+ Ext.getCmp('name').getValue());
							alert('Hello : '+ Ext.ComponentQuery.query('#nameI')[0].getValue());
						}
					}
					]
				}
            ]
        });
    }
});