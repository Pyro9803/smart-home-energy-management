package com.shems.common.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Instant;

@Data
@NoArgsConstructor
public class BaseResponse<T> {
    private boolean success;
    private String message;
    private T data;
    private Instant timestamp;

    public static <T> BaseResponse<T> success(T data) {
        return new BaseResponse<>(true, "Success", data, Instant.now());
    }

    public static <T> BaseResponse<T> error(String message) {
        return new BaseResponse<>(false, message, null, Instant.now());
    }

    public BaseResponse(boolean success, String message, T data, Instant timestamp) {
        this.success = success;
        this.message = message;
        this.data = data;
        this.timestamp = timestamp;
    }
}