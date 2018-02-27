package net.xaviersala.db;

import net.xaviersala.exceptions.ColorsException;
import net.xaviersala.model.Color;
import net.xaviersala.model.Message;

public interface ColorsDB {
	/**
	 * Obtenir el color a partir del seu nom.
	 * @param quin Nom del color
	 * @return Objecte Color amb el valor
	 * @throws ColorsException Problema que hi ha hagut al recuperar el color demanat
	 */
	Color getColor(String quin) throws ColorsException;

	/**
	 * Obtenir el color a partir del seu ID
	 * @param num ID del color a recuperar
	 * @return Objecte Color amb el valor
	 * @throws ColorsException Problema que hi ha hagut al recuperar el color demanat
	 */
	Color getNumero(String num) throws ColorsException;

	/**
	* Retorna el ID de color més gran
	* @return Número màxim
	* @throws ColorsException Problema que hi ha hagut al recuperar el número
	 */
	Message getMaxID() throws ColorsException;

}
