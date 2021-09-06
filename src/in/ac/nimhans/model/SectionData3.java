package in.ac.nimhans.model;

public class SectionData3 {
	
	    private int userId;
		
		private int section_id;
		private int sub_section_id;
		private String category_id;
		

		private int version_id;
		private String response;
		
		public SectionData3() {
			super();
			// TODO Auto-generated constructor stub
		}

		public SectionData3(int userId, int section_id, int sub_section_id, int version_id, String response, String category_id) {
			super();
			this.userId = userId;
			this.section_id = section_id;
			this.sub_section_id = sub_section_id;
			this.version_id = version_id;
			this.response = response;
			this.category_id = category_id;
			
			
			}
	
		
		
		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public int getSection_id() {
			return section_id;
		}

		public void setSection_id(int section_id) {
			this.section_id = section_id;
		}

		public int getSub_section_id() {
			return sub_section_id;
		}

		public void setSub_section_id(int sub_section_id) {
			this.sub_section_id = sub_section_id;
		}
		
		public String getCategory_id() {
			return category_id;
		}

		public void setCategory_id(String category_id) {
			this.category_id = category_id;
		}

		public int getVersion_id() {
			return version_id;
		}

		public void setVersion_id(int version_id) {
			this.version_id = version_id;
		}

		public String getResponse() {
			return response;
		}

		public void setResponse(String response) {
			this.response = response;
		}

		
		
}