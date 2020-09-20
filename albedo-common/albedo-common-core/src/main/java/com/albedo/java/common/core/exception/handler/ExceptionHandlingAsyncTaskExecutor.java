package com.albedo.java.common.core.exception.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.task.AsyncTaskExecutor;

import java.util.concurrent.Callable;
import java.util.concurrent.Future;

public class ExceptionHandlingAsyncTaskExecutor implements AsyncTaskExecutor,
	InitializingBean, DisposableBean {

	static final String EXCEPTION_MESSAGE = "Caught async exception";

	private final Logger log = LoggerFactory.getLogger(ExceptionHandlingAsyncTaskExecutor.class);

	private final AsyncTaskExecutor executor;

	/**
	 * <p>Constructor for ExceptionHandlingAsyncTaskExecutor.</p>
	 *
	 * @param executor a {@link org.springframework.core.task.AsyncTaskExecutor} object.
	 */
	public ExceptionHandlingAsyncTaskExecutor(AsyncTaskExecutor executor) {
		this.executor = executor;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void execute(Runnable task) {
		executor.execute(createWrappedRunnable(task));
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void execute(Runnable task, long startTimeout) {
		executor.execute(createWrappedRunnable(task), startTimeout);
	}

	private <T> Callable<T> createCallable(final Callable<T> task) {
		return () -> {
			try {
				return task.call();
			} catch (Exception e) {
				handle(e);
				throw e;
			}
		};
	}

	private Runnable createWrappedRunnable(final Runnable task) {
		return () -> {
			try {
				task.run();
			} catch (Exception e) {
				handle(e);
			}
		};
	}

	/**
	 * <p>handle.</p>
	 *
	 * @param e a {@link java.lang.Exception} object.
	 */
	protected void handle(Exception e) {
		log.error(EXCEPTION_MESSAGE, e);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public Future<?> submit(Runnable task) {
		return executor.submit(createWrappedRunnable(task));
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public <T> Future<T> submit(Callable<T> task) {
		return executor.submit(createCallable(task));
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void destroy() throws Exception {
		if (executor instanceof DisposableBean) {
			DisposableBean bean = (DisposableBean) executor;
			bean.destroy();
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void afterPropertiesSet() throws Exception {
		if (executor instanceof InitializingBean) {
			InitializingBean bean = (InitializingBean) executor;
			bean.afterPropertiesSet();
		}
	}
}

