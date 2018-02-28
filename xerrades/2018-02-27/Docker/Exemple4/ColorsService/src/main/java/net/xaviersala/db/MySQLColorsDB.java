package net.xaviersala.db;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import net.xaviersala.exceptions.ColorsException;
import net.xaviersala.model.Color;
import net.xaviersala.model.Message;

public class MySQLColorsDB implements ColorsDB {

	private static MysqlDataSource dataSource;

	static {

		try {
			dataSource = new MysqlDataSource();
			dataSource.setUser("root");
			dataSource.setPassword("ies2010");
			dataSource.setServerName("db");
			dataSource.setDatabaseName("colors");
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}

	@Override
	public Color getColor(String quin) throws ColorsException {
		Color color = new Color();

		QueryRunner run = new QueryRunner(dataSource);
		BeanHandler<Color> bhcolor = new BeanHandler<>(Color.class);

		try {
			color = run.query("SELECT * from color WHERE nom=?", bhcolor, quin);
			if (color.getId() == -1) {
				throw new ColorsException("Color inexistent");
			}
		} catch (SQLException sqle) {
			throw new ColorsException("Problemes accedint a la base de dades " + sqle);
		} catch (Exception e) {
			throw new ColorsException("Color inexistent");
		}
		return color;
	}

	@Override
	public Color getNumero(String num) throws ColorsException {
		Color color = new Color();

		QueryRunner run = new QueryRunner(dataSource);
		BeanHandler<Color> bhcolor = new BeanHandler<>(Color.class);

		try {
			color = run.query("SELECT * from color WHERE id=?", bhcolor, num);
			if (color.getId() == -1) {
				throw new ColorsException("Color inexistent");
			}
		} catch (SQLException sqle) {
			throw new ColorsException("Problemes accedint a la base de dades " + sqle);
		} catch (Exception e) {
			throw new ColorsException("Color inexistent");
		}
		return color;
	}

	@Override
	public Message getMaxID() throws ColorsException {
		String count = "0";
		ScalarHandler<Integer> scalarHandler = new ScalarHandler<>();

		QueryRunner run = new QueryRunner(dataSource);
		String query = "SELECT MAX(id) FROM color";
		try {
			int value = run.query(query, scalarHandler);
			count = String.valueOf(value);
		} catch (SQLException e) {
			throw new ColorsException("Problemes al comptar els elements de la base de dades");
		}
		return new Message(count);
	}


}
