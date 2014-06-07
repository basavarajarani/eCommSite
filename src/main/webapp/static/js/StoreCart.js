var shopCart = null;

$(function(){
	ShopCart = function(){
		this.init();
	};

	ShopCart.prototype = {
			init : function (){
				/* initialize the shop cart */
				this.cartPrefix = "phc-";
				this.cartName = this.cartPrefix + "cart";
				this.storage = sessionStorage;
				this.total = this.cartPrefix +"total";
				this.noOfItems = this.cartPrefix +"noOfItems";

				this.$shoppingcartmodal = $("#shoppingcart");
				this.$shoppingcarttbody = this.$shoppingcartmodal.find("tbody");
				this.$viewCartCount = $("#viewcartcountspan");

				this.createCart();
			},
			_emptyCart: function () {
				this.storage.clear();
			},
			_convertString: function( numStr ) {
				var num;
				if( /^[-+]?[0-9]+.[0-9]+$/.test( numStr ) ) {
					num = parseFloat( numStr );
				} else if( /^d+$/.test( numStr ) ) {
					num = parseInt( numStr );
				} else {
					num = Number( numStr );
				}

				if( !isNaN( num ) ) {
					return num;
				} else {
					console.warn( numStr + " cannot be converted into a number" );
					return false;
				}
			},

			_convertNumber: function( n ) {
				var str = n.toString();
				return str;
			},
			/* Converts a JSON string to a JavaScript object
			 * @param str String the JSON string
			 * @returns obj Object the JavaScript object
			 */

			_toJSONObject: function( str ) {
				var obj = JSON.parse( str );
				return obj;
			},

			/* Converts a JavaScript object to a JSON string
			 * @param obj Object the JavaScript object
			 * @returns str String the JSON string
			 */


			_toJSONString: function( obj ) {
				var str = JSON.stringify( obj );
				return str;
			},

			_addToCart : function(object) {
				var cart = this.storage.getItem(this.cartName);
				var cartObject = this._toJSONObject(cart);
				var cartCopy = cartObject;
				var items = cartCopy.items;
				var noOfItems = items.length;
				var total = 0;
				$.each(items, function(key,value){
					total+=parseFloat(value.total);
				});

				/* TBD Update it to the quantity*/
				noOfItems++;
				var itemTotal = parseFloat(object.price)*parseInt(object.quantity);
				object.total = itemTotal;
				items.push(object);
				total+=object.total;
				this.storage.setItem(this.cartName, this._toJSONString(cartCopy));
				this.storage.setItem(this.total,this._convertNumber(total));
				$(this.$viewCartCount).html(noOfItems+" Items - $"+total.toFixed(2));

			},
			returnCart : function(){
				return this._toJSONObject(this.storage.getItem(this.cartName));
			},
			returnTotal : function() {
				var total= parseFloat(this.storage.getItem(this.total)).toFixed(2);
				return total;
			},

			createCart : function() {
				if (this.storage.getItem(this.cartName) == null ){
					var cart = {};
					cart.items = [];
					this.storage.setItem(this.cartName, this._toJSONString(cart));
					this.storage.setItem(this.total,"0");
				}
			},

			updateViewCart : function() {
				var cart = this.storage.getItem(this.cartName);
				var cartObject = this._toJSONObject(cart);
				var items = cartObject.items;
				var noOfItems = items.length;
				var total = this.storage.getItem(this.total);
				$(this.$viewCartCount).html(noOfItems+" Items - $"+parseFloat(total).toFixed(2));

			},
			overWriteCart : function(cart,total,noOfItems) {
				this.storage.setItem(this.cartName,this._toJSONString(cart));
				this.storage.setItem(this.total,total);
				this.storage.setItem(this.noOfItems,noOfItems);
				this.updateViewCart();
			},
			removeItem : function(id){
				var cart = this.storage.getItem(this.cartName);
				var cartObject = this._toJSONObject(cart);
				var cartCopy = cartObject;
				var items = cartCopy.items;
				var itemsTemp = [];
				var noOfItems = 0;
				var cartTotal = 0;
				$.each(items,function(key,value){
					if(value.id != id){
						cartTotal += value.total;
						noOfItems += value.quantity;
						itemsTemp.push(value);
					}
				});
				cartCopy.items = itemsTemp;
				this.overWriteCart(cartCopy, cartTotal, noOfItems);
				this.updateViewCart();
			}
	};

	$(function(){
		shopCart = new ShopCart("#shoppingcart.table");
		shopCart.updateViewCart();

	});
});

function addToCart(button){
	var parentDiv = $(button).parents("div.single-item");
	var productToCart = new Object();
	productToCart.id = $(parentDiv).data("id");
	productToCart.name = $(parentDiv).data("name");
	productToCart.price = $(parentDiv).data("price");
	productToCart.quantity = $("#quantity").val();


	shopCart._addToCart(productToCart);
	console.log("hello");
}

function spinQuantity(event, ui){
	var cart = shopCart.returnCart();
	var items = cart.items;

	var spinnerItemId = this.name;
	var spinnerNewValue = this.value;
	var newTotal = 0;
	
	var itemTotalAfter = 0;
	var noOfItems = 0;

	$.each(items, function(key,value){
		if (value.id == spinnerItemId) {
			var itemPrice = value.price;
			itemTotalAfter = eval(itemPrice*spinnerNewValue);
			value.quantity = spinnerNewValue;
			value.total = parseFloat(itemTotalAfter).toFixed(2);
		}
		newTotal += parseFloat(value.total);
		noOfItems ++;

	});
	shopCart.overWriteCart(cart,newTotal,noOfItems);

	var parentTd = $(this).parents("td");
	var itemPriceTd = $(parentTd).next();
	var itemTotalTd = $(itemPriceTd).next();
	$(itemTotalTd).html("$"+parseFloat(itemTotalAfter).toFixed(2));
	$("#cartsubtotal").html("$"+parseFloat(""+newTotal).toFixed(2));
	console.log("hello");

}

function initspinners(){
	/* Initialize the spinner */
	$(".spinner").TouchSpin({
		min: 1,

	});
	/*	$("[id^=spinner]").spinner({
		min: 1,
		spin : function (event,ui){
			var cart = shopCart.returnCart();
			var items = cart.items;

			$.each(items, function(key,value){

			});
		}
	});*/
};