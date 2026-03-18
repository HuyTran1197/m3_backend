package com.example.quy_nhon_trip_2026.service;

import com.example.quy_nhon_trip_2026.dto.QuyNhonTripDto;
import com.example.quy_nhon_trip_2026.model.Category;
import com.example.quy_nhon_trip_2026.model.QuyNhonTrip;
import com.example.quy_nhon_trip_2026.repo.ICategoryRepo;
import com.example.quy_nhon_trip_2026.repo.IQuyNhonTripRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@Transactional
public class QuyNhonTripService implements IQuyNhonTripService{
    @Autowired
    private IQuyNhonTripRepo quyNhonTripRepo;
    @Autowired
    private ICategoryRepo categoryRepo;

    @Override
    public Page<QuyNhonTripDto> search(String name, LocalDateTime start, LocalDateTime end, String category, Pageable pageable) {
        return quyNhonTripRepo.search("%"+name+"%", start, end,"%"+category+"%", pageable);
    }

    @Override
    public boolean save(QuyNhonTrip quyNhonTrip) {
        try {
            quyNhonTripRepo.save(quyNhonTrip);
            return true;
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
        return false;
    }


}
