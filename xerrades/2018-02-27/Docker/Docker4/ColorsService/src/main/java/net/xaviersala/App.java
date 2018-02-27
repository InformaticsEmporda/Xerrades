package net.xaviersala;
import static spark.Spark.*;

import net.xaviersala.db.ColorsDB;
import net.xaviersala.db.MySQLColorsDB;
import net.xaviersala.exceptions.ColorsException;

public class App
{
	static final ColorsDB servei = new MySQLColorsDB();

    public static void main( String[] args )
    {
    	// Obtenir el color a partir del nom
        get("/color/:color", (request, response) -> {
        	String elColor = request.params(":color");
        	return servei.getColor(elColor);
        }, new JSONTransformer());

        // Obtenir el color a partir de l'ID
        get("/numero/:num", (request, response) -> {
        	String num = request.params(":num");
        	return servei.getNumero(num);
        }, new JSONTransformer());

        // Obtenir en número d'ID màxim
        get("/maxid", (request, response) -> {
            return servei.getMaxID();
        }, new JSONTransformer());

        // Mostrar l'error quan es produeix una excepció
        exception(ColorsException.class, (exception, request, response) -> {
            response.status(404);            
            response.body("{\"message\":\"" + exception.getMessage() + "\"}");
        	return;
        });
        // Capsaleres CORS
        before((request, response) -> {
            response.header("Access-Control-Allow-Origin", "*");
            response.header("Access-Control-Request-Method", "GET");
            response.header("Access-Control-Allow-Headers", "*");
            response.type("application/json");
        });
    }
}
