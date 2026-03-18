package com.example.quy_nhon_trip_2026.service;


import com.example.quy_nhon_trip_2026.dto.QuyNhonTripDto;
import com.example.quy_nhon_trip_2026.model.QuyNhonTrip;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;


public interface IQuyNhonTripService {
    Page<QuyNhonTripDto> search(@Param("searchName")String name,
                                @Param("searchStartTime") LocalDateTime start,
                                @Param("searchEndTime")LocalDateTime end,
                                @Param("searchCategory")String category,
                                Pageable pageable);

    boolean save(QuyNhonTrip quyNhonTrip);
}
