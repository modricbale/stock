package com.stock.pojo;

import java.io.Serializable;

	public class BaseResponse<T> implements Serializable {

		/**
		 * 
		 */
		private static final long serialVersionUID = -2161182621547021545L;

		
		private boolean ret;
		private T result;
		
		public BaseResponse() {
		}
		
		public BaseResponse(boolean ret, T result) {
			this.ret = ret;
			this.result = result;
		}
		
		public boolean isRet() {
			return ret;
		}
		public void setRet(boolean ret) {
			this.ret = ret;
		}
		public T getResult() {
			return result;
		}
		public void setResult(T result) {
			this.result = result;
		}
		
	}


