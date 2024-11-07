package ru.job4j.collection;

import java.util.List;
import java.util.ListIterator;
import java.util.Objects;
import java.util.function.Predicate;
import java.util.stream.Stream;

public class ListUtils {

    public static <T> void addBefore(List<T> list, int index, T value) {
        Objects.checkIndex(index, list.size());
        ListIterator<T> iterator = list.listIterator();
        for (int i = 0; i < index; i++) {
            iterator.next();
        }
        iterator.add(value);
    }

    public static <T> void addAfter(List<T> list, int index, T value) {
        Objects.checkIndex(index, list.size());
        ListIterator<T> iterator = list.listIterator();
        for (int i = 0; i < index + 1; i++) {
            iterator.next();
        }
        iterator.add(value);
    }

    public static <T> void removeIf(List<T> list, Predicate<T> filter) {
        ListIterator<T> iterator = list.listIterator();
        while (iterator.hasNext()) {
            iterator.next();
            if (!Stream.of(list.get(iterator.previousIndex())).filter(filter).toList().isEmpty()) {
                iterator.remove();
            }
        }
    }

    public static <T> void replaceIf(List<T> list, Predicate<T> filter, T value) {
        ListIterator<T> iterator = list.listIterator();
        while (iterator.hasNext()) {
            iterator.next();
            if (!Stream.of(list.get(iterator.previousIndex())).filter(filter).toList().isEmpty()) {
                iterator.set(value);
            }
        }
    }

    public static <T> void removeAll(List<T> list, List<T> elements) {
        ListIterator<T> iterator = elements.listIterator();
        while (iterator.hasNext()) {
            iterator.next();
            removeIf(list, x -> x == elements.get(iterator.previousIndex()));
        }
    }
}