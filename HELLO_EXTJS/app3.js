Ext.application({
    name: 'HelloExt',

    launch: function() {

		Ext.define('My.sample.Person', {
			name: 'Unknown',
			constructor: function(name) {
				if (name) {
					this.name = name;
				}
			},
			eat: function(foodType) {
				alert(this.name + " is eating: " + foodType);
			}
		});
		
		var aaron = Ext.create('My.sample.Person', 'Kuldeep');
		aaron.eat("Salad"); 
    }
});