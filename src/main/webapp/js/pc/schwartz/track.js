function trackHomeEvent(retailerName) {
	
	sessionStorage.setItem("clickFromHome","true");
	
	_gaq.push([ "_trackEvent", retailerName, "From Home" ]);
	// piwikTracker.setDocumentTitle("Home Page");
	piwikTracker.setCustomVariable(1, // Index, the number from 1 to 5 where
	// this custom variable name is stored
	"Click Retailer From Home", // Name, the name of the variable, for example:
	// Gender, VisitorType
	retailerName, // Value, for example: "Male", "Female" or "new", "engaged",
	// "customer"
	"visit" // Scope of the custom variable, "visit" means the custom variable
	// applies to the current visit
	);
	piwikTracker.trackPageView();
}

function trackingAddToBasket(retailerName,basketName) {

	var basket = getModelFromLocal(basketName, true);
	localStorage.removeItem(basketName);
	if (null != basket && undefined != basket) {
		var totalPrice = 0.00;
		var transId = (new Date()).getTime();
		$(basket).each(function(index, item) {
			totalPrice += parseFloat(item.price) * parseInt(item.quantity);
		});
		$(basket).each(function(index, item) {

			// add the first product to the order
			piwikTracker.addEcommerceItem(item.productId, // (required) SKU:
															// Product unique
															// identifier
			item.title, // (optional) Product name
			retailerName, // (optional) Product category. You can also specify
							// an
			// array of up to 5 categories eg. ["Books", "New
			// releases", "Biography"]
			item.price, // (recommended) Product price
			item.quantity // (optional, default to 1) Product quantity
			);
		});
		// Here you can add other products in the order
		// Specifiy the order details to Piwik server & sends the data to Piwik
		// server
		piwikTracker.trackEcommerceOrder(retailerName+transId, // (required) Unique
														// Order ID
		totalPrice, // (required) Order Revenue grand total (includes tax, shipping, and
		// subtracted discount)
		0, // (optional) Order sub total (excludes shipping)
		0, // (optional) Tax amount
		0, // (optional) Shipping amount
		false // (optional) Discount offered (set to false for unspecified
		// parameter)
		);
		// we recommend to leave the call to trackPageView() on the Order
		// confirmation page
		piwikTracker.trackPageView();
	}

}