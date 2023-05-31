package com.chixing.util;

import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.core.script.RedisScript;

import java.util.Collections;
import java.util.List;

public class LockUtil {

    private final StringRedisTemplate stringRedisTemplate;

    private final RedisScript<Boolean> luaScript;

    /**
     * 构造方法
     * @param stringRedisTemplate
     */
    public LockUtil(StringRedisTemplate stringRedisTemplate) {
        this.stringRedisTemplate = stringRedisTemplate;
        // 定义 Lua 脚本，用于实现加锁逻辑
        String luaScriptStr = "local lockKey = KEYS[1]\n" +
                "local lockValue = ARGV[1]\n" +
                "local lockExpire = ARGV[2]\n" +
                "if redis.call('setnx', lockKey, lockValue) == 1 then\n" +
                "   redis.call('expire', lockKey, lockExpire)\n" +
                "   return true\n" +
                "end\n" +
                "return false";
        // 将 Lua 脚本编译为 RedisScript 对象
        luaScript = new DefaultRedisScript<>(luaScriptStr, Boolean.class);
    }

    /**
     * 尝试获取锁
     *
     * @param lockKey 锁的键
     * @param lockValue 锁的值
     * @param lockExpire 锁的过期时间，单位为秒
     * @return 是否成功获取锁
     */
    public boolean tryLock(String lockKey, String lockValue, long lockExpire) {
        // 调用 RedisTemplate 的 execute 方法执行 Lua 脚本
        // 将 lockKey 作为第一个参数传递给 Lua 脚本
        // 将 lockValue 和 lockExpire 作为第二个和第三个参数传递给 Lua 脚本
        Object result = stringRedisTemplate.execute(luaScript, Collections.singletonList(lockKey), lockValue, String.valueOf(lockExpire));
        // 如果执行结果不为 null 并且返回值为 true，则表示成功获取锁
        return result != null && (Boolean) result;
    }

    /**
     * 释放锁
     *
     * @param lockKey 锁的键
     * @param lockValue 锁的值
     * @return 是否成功释放锁
     */
    public boolean releaseLock(String lockKey, String lockValue) {
        // 定义 Lua 脚本，用于实现释放锁的逻辑
        String luaScriptStr = "if redis.call('get', KEYS[1]) == ARGV[1] then\n" +
                "   return redis.call('del', KEYS[1])\n" +
                "else\n" +
                "   return 0\n" +
                "end";
        // 将 Lua 脚本编译为 RedisScript 对象
        RedisScript<Long> releaseScript = new DefaultRedisScript<>(luaScriptStr, Long.class);
        // 调用 RedisTemplate 的 execute 方法执行 Lua 脚本
        // 将 lockKey 作为第一个参数传递给 Lua 脚本
        // 将 lockValue 作为第二个参数传递给 Lua 脚本
        Object result = stringRedisTemplate.execute(releaseScript, Collections.singletonList(lockKey), lockValue);
        // 如果执行结果不为 null 并且返回值为 1，则表示成功释放锁
        return result != null && (Long) result == 1L;
    }

    /**
     * 批量加锁
     *
     * @param keys     锁的键列表
     * @param lockName 锁名称
     * @param expire   锁过期时间（秒）
     * @return 是否加锁成功
     */
    public boolean lockBatch(List<String> keys, String lockName, long expire) {
        String luaScript = "local locked = 1\n" +
                "for _, key in ipairs(KEYS) do\n" +
                "    if redis.call('exists', key) == 1 then\n" +
                "        locked = 0\n" +
                "    else\n" +
                "        redis.call('set', key, ARGV[1], 'EX', ARGV[2])\n" +
                "    end\n" +
                "end\n" +
                "return locked";

        RedisScript<Long> script = new DefaultRedisScript<>(luaScript, Long.class);
        Object result = stringRedisTemplate.execute(script, keys, lockName, String.valueOf(expire));
        return result != null && (Long) result == 1L;
    }

    /**
     * 批量解锁
     *
     * @param keys     锁的键列表
     * @param lockName 锁名称
     * @return 是否解锁成功
     */
    public boolean unlockBatch(List<String> keys, String lockName) {
        String luaScript = "local unlocked = 1\n" +
                "for _, key in ipairs(KEYS) do\n" +
                "    if redis.call('get', key) == ARGV[1] then\n" +
                "        redis.call('del', key)\n" +
                "    else\n" +
                "        unlocked = 0\n" +
                "    end\n" +
                "end\n" +
                "return unlocked";

        RedisScript<String> script = new DefaultRedisScript<>(luaScript, String.class);
        Object result = stringRedisTemplate.execute(script, keys, lockName);
        return result != null && (Long) result == 1L;
    }


}