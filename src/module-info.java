module Splits {
	requires javafx.controls;
	requires javafx.fxml;
	requires java.sql;
	requires junit;
	
	opens application to javafx.graphics, javafx.fxml;
}
