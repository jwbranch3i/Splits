package application;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Splits extends Application
{
	@Override
	public void start(Stage primaryStage)
	{
		try
		{
			FXMLLoader loader = new FXMLLoader(getClass().getResource("main.fxml"));
			Parent root = loader.load();
			MainController controller = loader.getController();
			controller.listTransactions();

			Scene scene = new Scene(root, 900, 800);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			primaryStage.setScene(scene);
			primaryStage.show();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public static void main(String[] args)
	{
		launch(args);
	}
}
