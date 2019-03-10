package com.sytecso.captions;



public interface OrdenCaption {
	Orden getOrden();
	
	interface Orden{
		String getFechaInicio();
		String getFechaFin();
		Integer getTiempoTotalOrden();
		String getDescripcion();
		DatosUsuarioFinal getDatosUsuarioFinal();
		interface DatosUsuarioFinal {
			String getNumeroCuenta();
			String getNombreCuenta();
			String getTipoCuenta();
			Telefono getTelefono();
			DatosInstalacion getDatosInstalacion();
			DireccionInstalacion getDireccionInstalacion();
			interface Telefono {
				String getTelefono();
				String getTipoTelefono();
			}
			interface DireccionInstalacion {
				String getNumeroExterior();
				String getPiso();
				String getNumeroInterior();
				String getColonia();
				String getDelegacion();
				String getCiudad();
				String getEstado();
				String getCodigoPostal();
				String getLongitud();
				String getLatitud();
			}
			interface DatosInstalacion {
				String getFolio();
				String getIdOTFFM();
				String getIdCompania();
				String getTurno();
				String getFechaAgendamiento();
				String getDatosInstalacionCol();
				String getCotizacion();
				String getOportunidad();
				String getPlaza();
				String getCluster();
			}
		}
	}
}

