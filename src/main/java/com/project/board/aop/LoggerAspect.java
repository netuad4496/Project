package com.project.board.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LoggerAspect {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Around("execution(* com.project.board..controller.*Controller.*(..)) or execution(* com.project.board..service.*Impl.*(..)) or execution(* com.project.board..mapper.*Mapper.*(..))")
    public Object printLog(ProceedingJoinPoint joinPoint) throws Throwable {

        String type = "";
        String name = joinPoint.getSignature().getDeclaringTypeName();

        if (name.contains("Controller") == true) {
            type = "Controller ===> ";

        } else if (name.contains("Service") == true) {
            type = "ServiceImpl ===> ";

        } else if (name.contains("Mapper") == true) {
            type = "Mapper ===> ";
        }

        logger.debug(type + name + "." + joinPoint.getSignature().getName() + "()");
        return joinPoint.proceed();
    }

}
//https://congsong.tistory.com/25?category=749196
// 트랜잭션