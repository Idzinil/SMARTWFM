package com.sytecso.component;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.nio.ByteBuffer;
import java.text.DecimalFormat;

import com.sytecso.exceptions.SytecsoException;

public class UtileriaCompruebaDatos {
	private UtileriaCompruebaDatos() {
		throw new IllegalStateException("UtilericaCompras");
	}
	
	/**
	 * Este metodo convierte un Float a tres decimales
	 * 
	 * @param monto
	 * @return Float a 3 decimales
	 **/
	public static Float floatToThreeDecimals(Float monto) {
		String number = numberFormat(monto);
		BigDecimal decimal = new BigDecimal(number).setScale(3,BigDecimal.ROUND_UNNECESSARY);
		return decimal.floatValue();
	}
	
	/**
	 * Este metodo divide o multiplica una cantidad, aplicando los metodos de redondeo definidios en el sistem
	 * @param amount cantidad a multiplicar o dividir
	 * @param cantidadOper monto el cual sera usado para multiplicar o dividir la cantidad dada
	 * @param option opcion la cual indica la operaionc a realizar, 0: multiplicacion,1:division 
	 * @return cantidad con parametros redondeados
	 * */
	
	public static BigDecimal divideOrMultiplyAmount(BigDecimal amount,BigDecimal cantidadOper,int option) {
		try {
			switch (option) {
			case 0:
				amount = amount.multiply(cantidadOper).setScale(10, RoundingMode.HALF_EVEN);
				if(amount.compareTo(BigDecimal.ZERO)>0) {
					amount = amount.setScale(10, RoundingMode.CEILING);
					return amount.setScale(6, RoundingMode.HALF_UP);
				}
				break;
			case 1:
				amount = amount.divide(cantidadOper, 10, RoundingMode.HALF_EVEN);
				if(amount.compareTo(BigDecimal.ZERO)>0) {
					amount = amount.setScale(10, RoundingMode.HALF_UP);
					return amount.setScale(6, RoundingMode.HALF_DOWN);
				}
				break;
			default:
				SytecsoLogger.info("La opcion: "+ option + " en el sistema");
				break;
			}
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return null;
	}
	
	/**
	 * Este metodo convierte un Double a tres decimales
	 * 
	 * @param monto
	 * @return Double a 3 decimaes
	 **/
	public static Double doubleToThreeDecimals(Double monto) {
		String number = numberFormat(monto);
		BigDecimal decimal = new BigDecimal(number).setScale(3,BigDecimal.ROUND_UNNECESSARY);
		return decimal.doubleValue();
	}
	public static BigDecimal bigDecimalFormat(Number monto) {
		String number = numberFormat(monto);
		return new BigDecimal(String.valueOf(number)).setScale(4,BigDecimal.ROUND_DOWN);
	}
	/**
	 * Este metodo convierte una cantidad a tres decimales
	 * 
	 * @param monto:
	 * @return monto a 3 decimales
	 */
	private static String numberFormat(Number monto) {
		DecimalFormat df = new DecimalFormat("0.0000");
		return df.format(monto);
	}
	
	/**
	 * Esta funcion comprueba si un dato es nulo
	 * 
	 * @param data
	 * @return vacio o data
	 */
	@SuppressWarnings("unchecked")
	public static <T> T compruebaDataNulo(T data) {
		if (data != null) {
			return data;
		}
		return (T) String.valueOf("");
	}

	@SuppressWarnings("unchecked")
	public static <T> T compruebaFloatNulo(T data) {
		if (data != null) {
			return data;
		}
		return (T) Float.valueOf(0);
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T compruebaLongNulo(T data) {
		if (data != null) {
			return data;
		}
		return (T) Long.valueOf(0);
	}
	@SuppressWarnings("unchecked")
	public static <T> T compruebaNumberNull(T data) {
		if (data != null && data instanceof Number) {
			return data;
		}
		return (T) Float.valueOf(0);
	}
	@SuppressWarnings("unchecked")
	public static <T> T compruebaBigDecimalNull(T data) {
		if (data != null && data instanceof Number) {
			return data;
		}
		return (T) BigDecimal.valueOf(0);
	}
	/**
	 * Este metodo convierte un int a Byte[] con una longitud minima de 4 hexadecimales
	 * 
	 * @param ByteTam tamanio del arreglo de byte
	 * @param data numero que sera convertido a bytes
	 * @return byte[]
	 */
	public static byte[] getByteArray(int byteTam, int data) {
		return  ByteBuffer.allocate(byteTam).putInt(data).array();
	}
	/**
	 * Este metodo convierte un int a Byte[] con una longitud de 4 hexadecimales
	 * @param data numero que sera convertido a bytes
	 * @return byte[]
	 */
	public static byte[] getByteArray(int data) {
		return  new byte[] {(byte)(data)};
	}
	public byte[] convertToByte(final int i) {
		BigInteger bigInt= BigInteger.valueOf(i);
		return bigInt.toByteArray();
	}
	public static String removeSpecialCharacters(Object obj) {
		String str = String.valueOf(obj);
		return str.replaceAll("[^\\d.]", "");
	}
	
	public static Integer getBinaryValue(Object str) {
		try {
			return Integer.parseInt(removeSpecialCharacters(str),2);
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return null;
	}
	
	public static int convertToBinary(int value) {
		try {
			return Integer.parseInt(Integer.toBinaryString(value));
		} catch (Exception e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return 0;
	}
	
	
	/**
	 * Este metodo obtiene el monto real que se pagara en una factura,contrato o item, esto ya que hay redondeos hacia arriba o hacia abajo
	 * entonces, este metodo comprueba si el monto que se esta pagando, es redondeado o no, esto solo aplica cuando se paga un monto completo
	 * @param restante monto restante el cual se usara para comprobar si se esta cubrinedo este monto total o no
	 * @param montoPagar monto que se esta usando para cubrir el monto restante
	 * @return monto real que se esta cubriendo
	 * */
	public static BigDecimal getRealMontoPagar(BigDecimal restante,BigDecimal montoPagar) {
		BigDecimal rRestanteH = restante.setScale(3,RoundingMode.HALF_UP);
		BigDecimal rRestanteD = restante.setScale(3,RoundingMode.DOWN);
		if(restante.compareTo(montoPagar)==0 || rRestanteD.compareTo(montoPagar)==0 || rRestanteH.compareTo(montoPagar)==0)
			return restante;
		else if(restante.compareTo(montoPagar)>0)
			return montoPagar;
		return null;
	}
	/**
	 * Este metodo trunca una cantidad a N numeo de decimales
	 * @param x cantidad a truncar
	 * @param numberofDecimals numero de decimales a los que se truncara la cantidad
	 * @return cantidad truncada a N decimales
	 * */
	public static BigDecimal truncateDecimal(BigDecimal x,int numberofDecimals)	{
	    if ( x.compareTo(BigDecimal.ZERO) > 0) {
	        return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_FLOOR);
	    } else {
	        return new BigDecimal(String.valueOf(x)).setScale(numberofDecimals, BigDecimal.ROUND_CEILING);
	    }
	}
	/**
	 * Este metodo convierte un Booleano a Byte[]
	 * 
	 * @param prorrateo
	 * @return byte[]
	 */
	public static byte[] convertBooleanToByte(Boolean prorateo) {
		return new byte[] { (byte) (prorateo ? 1 : 0) };
	}
	
	/**Este metodo obtiene el booleano de un byte[]
	 * @param status
	 * @return true o false
	 * */
	public static Boolean convertByteToBoolean(byte[] status) {
		if(status!=null)
			return status[0]>0;
		return false;	
	}
	
}
