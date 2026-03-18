package com.example.quy_nhon_trip_2026.repo;

import com.example.quy_nhon_trip_2026.dto.QuyNhonTripDto;
import com.example.quy_nhon_trip_2026.model.QuyNhonTrip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;


public interface IQuyNhonTripRepo extends JpaRepository<QuyNhonTrip,Long> {
    @Query(value = "SELECT qn.id AS id, qn.name AS name, qn.price AS price, " +
            "qn.location AS location, qn.start_time AS startTime, " +
            "qn.end_time AS endTime, c.name AS category " +
            "FROM quy_nhon_trip qn " +
            "JOIN category c ON qn.category_id = c.id " +
            "WHERE (:searchName IS NULL OR qn.name LIKE :searchName) " +
            "and (:searchStartTime is null or qn.end_time > :searchStartTime) " +
            "and (:searchEndTime is null or qn.start_time < :searchEndTime) " +
            "AND (:searchCategory IS NULL OR c.name LIKE :searchCategory)",
            nativeQuery = true)
    Page<QuyNhonTripDto> search(@Param("searchName") String name,
                                @Param("searchStartTime") LocalDateTime start,
                                @Param("searchEndTime") LocalDateTime end,
                                @Param("searchCategory") String category,
                                Pageable pageable);
}
