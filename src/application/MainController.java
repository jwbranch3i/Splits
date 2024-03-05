package application;

import java.time.LocalDate;

import dataModel.AcctData;
import dataModel.Transaction;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;

public class MainController
{
	// private MainController instance = new MainController();

	@FXML
	private TableView<Transaction> table;

	@FXML
	private TableColumn<Transaction, LocalDate> colDate;

	@FXML
	private TableColumn<Transaction, String> colDiscription;

	@FXML
	private TableColumn<Transaction, String> colGas;

	@FXML
	private TableColumn<Transaction, String> colService;

	@FXML
	private TableColumn<Transaction, String> colJohn;

	@FXML
	private TableColumn<Transaction, String> colPastor;

	@FXML
	private TableColumn<Transaction, String> colMed;

	@FXML
	private TableColumn<Transaction, String> colSchool;

	@FXML
	private TableColumn<Transaction, String> colMisc;

	@FXML
	private TableColumn<Transaction, String> colTransactionTotal;

	@FXML
	private TextField totalGas;

	@FXML
	private TextField totalService;

	@FXML
	private TextField totalJohn;

	@FXML
	private TextField totalPastor;

	@FXML
	private TextField totalMed;

	@FXML
	private TextField totalSchool;

	@FXML
	private TextField totalMisc;

	@FXML
	private Label totalAcct;

	public void initialize()
	{
		// totalGas.setText(String.format("%.2f", data.getTotalGas()));
		// totalService.setText(String.format("%.2f", data.getTotalService()));
		// totalJohn.setText(String.format("%.2f", data.getTotalJohn()));
		// totalPastor.setText(String.format("%.2f", data.getTotalPastor()));
		// totalMed.setText(String.format("%.2f", data.getTotalMed()));
		// totalSchool.setText(String.format("%.2f", data.getTotalSchool()));
		// totalMisc.setText(String.format("%.2f", data.getTotalMisc()));
		// totalAcct.setText(String.format("%.2f", data.getTotalAcct()));

		colDate.setCellValueFactory(new PropertyValueFactory<Transaction, LocalDate>("transactionDate"));

		colDiscription.setCellValueFactory(new PropertyValueFactory<Transaction, String>("discription"));

		colGas.setCellValueFactory(new PropertyValueFactory<Transaction, String>("gas"));
		colGas.setStyle("-fx-alignment: CENTER-RIGHT");

		colService.setCellValueFactory(new PropertyValueFactory<Transaction, String>("service"));
		colService.setStyle("-fx-alignment: CENTER-RIGHT");

		colJohn.setCellValueFactory(new PropertyValueFactory<Transaction, String>("john"));
		colJohn.setStyle("-fx-alignment: CENTER-RIGHT");

		colMed.setCellValueFactory(new PropertyValueFactory<Transaction, String>("medical"));
		colMed.setStyle("-fx-alignment: CENTER-RIGHT");

		colMisc.setCellValueFactory(new PropertyValueFactory<Transaction, String>("misc"));
		colMisc.setStyle("-fx-alignment: CENTER-RIGHT");

		colTransactionTotal.setCellValueFactory(new PropertyValueFactory<Transaction, String>("transactionTotal"));
		colTransactionTotal.setStyle("-fx-alignment: CENTER-RIGHT");

	}

	/******************************************/
	public void listTransactions()
	{
		Task<ObservableList<Transaction>> task = new GetAllTransactions();
		table.itemsProperty().bind(task.valueProperty());

		new Thread(task).start();
	}
}

/******************************************/
class GetAllTransactions extends Task
{
	public ObservableList<Transaction> call()
	{
		return FXCollections.observableArrayList(AcctData.getInstance().queryTransactions(AcctData.ORDER_BY_ASC));

	}
}
