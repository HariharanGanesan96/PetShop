package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import com.petshop.model.*;
import com.petshop.util.*;

public class PetDAO {

	SimpleDateFormat formeter = new SimpleDateFormat("dd-mm-yyyy");

	List<PetDetails> petList = new ArrayList<PetDetails>();
	PetDetails pet = new PetDetails();
	ResultSet resultSet = null;
	ConnectionUtil connectionUtil = new ConnectionUtil();
	Connection connection = null;
	PreparedStatement pstmt = null;
	String query = "";

	public void commit() {
		try {
			connection = connectionUtil.getDbConnect();
			query = "commit";
			pstmt = connection.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public List<PetDetails> getPetList() {
		try {
			while (resultSet.next()) {

				pet = new PetDetails(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getDate(5), resultSet.getInt(6), resultSet.getString(7),
						resultSet.getString(8), resultSet.getDouble(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getInt(12), resultSet.getInt(13), resultSet.getDate(14),
						resultSet.getInt(15));
				petList.add(pet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return petList;
	}

	// insert pet_details
	public void insertPetDetails(PetDetails pet) {

		try {
			connection = connectionUtil.getDbConnect();
			query = "INSERT into pet_details(pet_type,pet_name,pet_gender,pet_dob,pet_Qty,pet_description,\r\n"
					+ "pet_color,pet_price,pet_image,customer_id,available_qty) values(?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, pet.getPetType());
			pstmt.setString(2, pet.getPetName());
			pstmt.setString(3, pet.getPetGender());
			String dob = formeter.format(pet.getPetDob());
			pstmt.setString(4, dob);
			pstmt.setInt(5, pet.getPetQty());
			pstmt.setString(6, pet.getDescription());
			pstmt.setString(7, pet.getPetColor());
			pstmt.setDouble(8, pet.getPetprice());
			pstmt.setString(9, pet.getPetImage());
			pstmt.setInt(10, pet.getCustomer().getCustomerId());
			pstmt.setInt(11, pet.getAvilableQty());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// Update pet_details
	public void updatePetDetails(PetDetails pet) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update pet_details set pet_type=?,pet_name=?,"
					+ "pet_gender=?,pet_dob=?,pet_Qty=?,pet_description=?,"
					+ "pet_color=?,pet_price=?,pet_image=?,customer_id=?," + "available_qty=? where pet_id=?";

			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, pet.getPetType());
			pstmt.setString(2, pet.getPetName());
			pstmt.setString(3, pet.getPetGender());
			String dob = formeter.format(pet.getPetDob());
			pstmt.setString(4, dob);
			pstmt.setInt(5, pet.getPetQty());
			pstmt.setString(6, pet.getDescription());
			pstmt.setString(7, pet.getPetColor());
			pstmt.setDouble(8, pet.getPetprice());
			pstmt.setString(9, pet.getPetImage());
			pstmt.setInt(10, pet.getCustomer().getCustomerId());
			pstmt.setInt(11, pet.getPetQty());
			pstmt.setInt(12, pet.getPetId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// To update pet Status admin approval
	public void updatePetStatus(int petId, String status, int adminId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update pet_details set status=?,admin_id=? where pet_id=?";
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, adminId);
			pstmt.setInt(3, petId);
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	// to show all the approved pet details
	public List<PetDetails> showAllpetsDetails(Customers customer) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from pet_details where status='approved' and available_qty > 0 and customer_id not in(?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, customer.getCustomerId());
			resultSet = pstmt.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return getPetList();
	}

	// to get particular pet data
	public PetDetails showCurrentPet(int petId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from pet_details where pet_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, petId);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				pet = new PetDetails(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getDate(5), resultSet.getInt(6), resultSet.getString(7),
						resultSet.getString(8), resultSet.getDouble(9), resultSet.getString(10),
						resultSet.getString(11), resultSet.getInt(12), resultSet.getInt(13), resultSet.getDate(14),
						resultSet.getInt(15));

				query = "select * from customers where customer_id=?";
				pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, resultSet.getInt(12));
				resultSet = pstmt.executeQuery();
				if (resultSet.next()) {
					pet.getCustomer().setFirstName(resultSet.getString(2));
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return pet;
	}

	// pet list to show admin
	public List<PetDetails> showNotApprovedPetList() {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from pet_details where status='Not approved'";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return getPetList();
	}

	// My pet details for customer
	public List<PetDetails> showMypetdetails(int cusId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from pet_details where customer_id='" + cusId + "'";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return getPetList();
	}

	// search pet
	public List<PetDetails> searchPetDetails(String search, int customerId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from pet_details where (pet_type like '%" + search + "%' or pet_name like '%" + search
					+ "%') and status='approved' and available_qty > 0 and customer_id not in(" + customerId + ")";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return getPetList();
	}

	// delete status to update
	public void delete(PetDetails pet) {
		try {
			connection = connectionUtil.getDbConnect();
			String query = "update pet_details set status='deleted' where pet_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pet.getPetId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	// update available qty
	public void updatePetAvailableQuantity(PetDetails pet) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Pet_details set available_qty=? where pet_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pet.getAvilableQty());
			pstmt.setInt(2, pet.getPetId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	// get status
	public String getPetStatus(PetDetails pet) throws SQLException {
		String status = "";
		try {
			connection = connectionUtil.getDbConnect();
			query = "select status from Pet_details  where pet_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pet.getPetId());
			resultSet = pstmt.executeQuery();
			resultSet.next();
			status = resultSet.getString(1);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;

	}
}
