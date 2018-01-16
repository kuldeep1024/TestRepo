Ext.application({
    name: 'HelloExt',

    launch: function() {
        Ext.create('Ext.container.Viewport', {		
            layout: 'fit',
			///renderTo: Ext.getBody(),

            items: [
				{
					xtype: 'container',
					height: 50,
					width: 250,
					
					items: [{
            xtype: 'form',
            border: 1,
            bodyStyle: 'padding: 10px;',
            items: [
            {
                xtype: 'textfield',
                fieldLabel: 'Name',
                allowBlank: false,
                name: 'nameField',
                id: 'nameID',
            },
            {
                xtype: 'textfield',
                fieldLabel: 'Email',
                allowBlank: false,
                name: 'emailField',
                id: 'emailID',
            }],
            buttons: [
            {
                xtype: 'button',
                text: 'Test1',
                action: 'Test Button1',
                id: 'textButton1id',
                name: 'textButton2Name',
                listeners: {
                    click: function(button, e, options){
                        var text1 = Ext.getCmp('nameID').getValue();
                        var text2 = Ext.getCmp('emailID').getValue();
                        Ext.Msg.alert('ValueName:  ' + text1 + ' Address : ' + text2);
                    }
                }
            },
            {
                xtype: 'button',
                text: 'Test2',
                action: 'Test Button2',
                id: 'textButton2id',
                name: 'textButton2Name',
                listeners: {
                    click: function(button, e, options){
                        var text1 = Ext.getCmp('textButton1id').getText();
                        Ext.Msg.alert('ValueButton1 : ' + text1);
                    }
                }
            }]
        }]
				}
            ]
        });

    }
});