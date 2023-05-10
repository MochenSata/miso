package com.chixing.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author smith
 * @since 2023-05-10
 */
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 消息id
     */
    @TableId(value = "message_id", type = IdType.AUTO)
    private Integer messageId;

    /**
     * 消息状态
     */
    private Integer messageStatus;

    /**
     * 消息创建时间
     */
    private LocalDateTime messageCreateTime;

    /**
     * 消息更新时间
     */
    private LocalDateTime messageUpdateTime;

    /**
     * 用户id
     */
    private Integer custId;

    /**
     * 消息详情内容
     */
    private String messageText;

    /**
     * 发送时间
     */
    private LocalDateTime messageSendtime;

    private Integer version;

    private String other1;

    private String other2;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }
    public Integer getMessageStatus() {
        return messageStatus;
    }

    public void setMessageStatus(Integer messageStatus) {
        this.messageStatus = messageStatus;
    }
    public LocalDateTime getMessageCreateTime() {
        return messageCreateTime;
    }

    public void setMessageCreateTime(LocalDateTime messageCreateTime) {
        this.messageCreateTime = messageCreateTime;
    }
    public LocalDateTime getMessageUpdateTime() {
        return messageUpdateTime;
    }

    public void setMessageUpdateTime(LocalDateTime messageUpdateTime) {
        this.messageUpdateTime = messageUpdateTime;
    }
    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }
    public String getMessageText() {
        return messageText;
    }

    public void setMessageText(String messageText) {
        this.messageText = messageText;
    }
    public LocalDateTime getMessageSendtime() {
        return messageSendtime;
    }

    public void setMessageSendtime(LocalDateTime messageSendtime) {
        this.messageSendtime = messageSendtime;
    }
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
    public String getOther1() {
        return other1;
    }

    public void setOther1(String other1) {
        this.other1 = other1;
    }
    public String getOther2() {
        return other2;
    }

    public void setOther2(String other2) {
        this.other2 = other2;
    }

    @Override
    public String toString() {
        return "Message{" +
            "messageId=" + messageId +
            ", messageStatus=" + messageStatus +
            ", messageCreateTime=" + messageCreateTime +
            ", messageUpdateTime=" + messageUpdateTime +
            ", custId=" + custId +
            ", messageText=" + messageText +
            ", messageSendtime=" + messageSendtime +
            ", version=" + version +
            ", other1=" + other1 +
            ", other2=" + other2 +
        "}";
    }
}
